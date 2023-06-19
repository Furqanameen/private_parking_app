require 'application_system_test_case'

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test 'visiting the index' do
    visit reservations_url
    assert_selector 'h1', text: 'Reservations'
  end

  test 'should create reservation' do
    visit reservations_url
    click_on 'New reservation'

    fill_in 'Charges', with: @reservation.charges
    fill_in 'Check in', with: @reservation.check_in
    fill_in 'Check out', with: @reservation.check_out
    fill_in 'End time', with: @reservation.end_time
    fill_in 'Number of hours', with: @reservation.number_of_hours
    fill_in 'Slot', with: @reservation.slot_id
    fill_in 'Start time', with: @reservation.start_time
    fill_in 'Status', with: @reservation.status
    fill_in 'User', with: @reservation.user_id
    fill_in 'Vehicle number', with: @reservation.vehicle_number
    click_on 'Create Reservation'

    assert_text 'Reservation was successfully created'
    click_on 'Back'
  end

  test 'should update Reservation' do
    visit reservation_url(@reservation)
    click_on 'Edit this reservation', match: :first

    fill_in 'Charges', with: @reservation.charges
    fill_in 'Check in', with: @reservation.check_in
    fill_in 'Check out', with: @reservation.check_out
    fill_in 'End time', with: @reservation.end_time
    fill_in 'Number of hours', with: @reservation.number_of_hours
    fill_in 'Slot', with: @reservation.slot_id
    fill_in 'Start time', with: @reservation.start_time
    fill_in 'Status', with: @reservation.status
    fill_in 'User', with: @reservation.user_id
    fill_in 'Vehicle number', with: @reservation.vehicle_number
    click_on 'Update Reservation'

    assert_text 'Reservation was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Reservation' do
    visit reservation_url(@reservation)
    click_on 'Destroy this reservation', match: :first

    assert_text 'Reservation was successfully destroyed'
  end
end
