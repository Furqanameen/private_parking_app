class SlotsController < ApplicationController
  def index
    @slots = SlotsCollection.new(Slot.get_available_slots, params).call
  end

  def book_slot
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path, notice: 'Reservation was successfully created.'
    else
      render :book_slot
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :slot_id, :user_id, :number_of_hours, :status, :vehicle_number)
  end
end
