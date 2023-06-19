require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test 'should get index' do
    get reservations_url
    assert_response :success
  end

  test 'should get new' do
    get new_reservation_url
    assert_response :success
  end

  test 'should create reservation' do
    assert_difference('Reservation.count') do
      post reservations_url,
           params: { reservation: { charges: @reservation.charges, check_in: @reservation.check_in,
                                    check_out: @reservation.check_out, end_time: @reservation.end_time, number_of_hours: @reservation.number_of_hours, slot_id: @reservation.slot_id, start_time: @reservation.start_time, status: @reservation.status, user_id: @reservation.user_id, vehicle_number: @reservation.vehicle_number } }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test 'should show reservation' do
    get reservation_url(@reservation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_reservation_url(@reservation)
    assert_response :success
  end

  test 'should update reservation' do
    patch reservation_url(@reservation),
          params: { reservation: { charges: @reservation.charges, check_in: @reservation.check_in,
                                   check_out: @reservation.check_out, end_time: @reservation.end_time, number_of_hours: @reservation.number_of_hours, slot_id: @reservation.slot_id, start_time: @reservation.start_time, status: @reservation.status, user_id: @reservation.user_id, vehicle_number: @reservation.vehicle_number } }
    assert_redirected_to reservation_url(@reservation)
  end

  test 'should destroy reservation' do
    assert_difference('Reservation.count', -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
