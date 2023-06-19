class Slot < ApplicationRecord
  enum features: %i[car_type disabled_people has_shade]
  enum slot_time: %i[morning evening]

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true
  validates :slot_time, presence: true
  validates :features, presence: true

  validate :valid_time_range

  has_one :reservation
  has_one :user, through: :reservation

  scope :get_available_slots, -> { where(is_available: true) }
  scope :get_unavailable_slots, -> { where(is_available: false) }

  scope :filter_by_features, ->(feature) { where(features: feature) }

  scope :filter_by_date_and_time, lambda { |start_time, end_time|
                                    where('open_time >= ? AND close_time <= ?', start_time, end_time)
                                  }

  private

  def valid_time_range
    errors.add(:close_time, 'must be after start time') if close_time && open_time && close_time <= open_time
  end
end
