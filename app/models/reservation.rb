class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :slot

  validates :number_of_hours, presence: true
  validates :vehicle_number, presence: true
  validates :status, presence: true

  enum status: %i[reserved cancelled]
  validate :validating_checkin_checkout
  validate :check_existed_reservation_with_same_datetime

  before_update :check_slot_availability

  after_create :make_unavailable_reservation
  after_save :reservation_charges

  private

  def check_slot_availability
    return unless slot_id_changed?
    Slot.find_by(id: slot_id_was).update(is_available: true)
    Slot.find_by(id: slot_id).update(is_available: false)
  end

  def reservation_charges
    if check_in.present?
      # As customer will checkout/leave
      slot_price = Slot.find_by(id: slot_id).price
      self.charges = number_of_hours * slot_price
    elsif status == 'cancelled'
      # if reservation will be canceled in that case customer have to pay half chrages of actual slot on the base of hours
      make_unavailable_reservation
      slot_price = Slot.find_by(id: slot_id).price / 2
      self.charges = number_of_hours * slot_price
    end
  end

  def make_unavailable_reservation
    Slot.find_by(id: slot_id).update(is_available: false)
  end

  def validating_checkin_checkout
    errors.add(:check_out, 'must be after Check in') if check_out && check_in && check_out <= check_in
  end

  def check_existed_reservation_with_same_datetime
    errors.add(:open_time, 'with this open time and closing you already booked a slot') if Slot.all.select{|sl| sl.open_time == slot.open_time && sl.close_time == slot.close_time}.any?
  end
end
