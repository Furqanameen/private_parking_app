class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[edit check_out check_in update]
  def index
    @reservations = current_user.reservations # .where(status: "reserved")
  end

  def edit; end

  def check_in
    if @reservation.update(check_in: Time.now)
      redirect_to reservations_path, notice: 'Reservation was successfully Checked In.'
    else
      redirect_to reservations_path, notice: 'Reservation was Failed Checked In.'
    end
  end

  def check_out
    if @reservation.update(check_out: Time.now)
      redirect_to reservations_path, notice: 'Reservation was successfully Checked Out.'
    else
      redirect_to reservations_path, notice: 'Reservation was Failed Checked Out.'
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: 'Reservation was successfully Updated.'
    else
      render :edit
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :number_of_hours, :status, :vehicle_number)
  end

  def set_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end
end
