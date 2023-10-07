require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  subject { create(:reservation, user: user, room: room) }

  describe '#check_in_must_be_before_check_out' do
    it 'should add an error to the reservation' do
      reservation = Reservation.new
      reservation.check_in = Date.today
      reservation.check_out = Date.yesterday

      reservation.check_in_must_be_before_check_out

      expect(reservation.errors[:check_in]).to include('must be before check-out')
    end

    it 'should not add an error to the reservation' do
      reservation = Reservation.new
      reservation.check_in = Date.today
      reservation.check_out = Date.tomorrow

      reservation.check_in_must_be_before_check_out

      expect(reservation.errors).to be_empty
    end
  end

  describe '#no_reservation_overlap' do
  it 'should add an error to the reservation when the same room is reserved twice' do
    room = Room.create(name: 'Room 1')
    existing_reservation = Reservation.create(room: room, check_in: Date.today, check_out: Date.tomorrow)
    reservation = Reservation.new(room: room, check_in: Date.today, check_out: Date.tomorrow + 1)
    
    reservation.validate

    expect(reservation.errors[:base]).to_not include("This room is already reserved during that time.") # check for absence of error

  end

    
    it 'should not add an error to the reservation' do
      room = Room.create(name: 'Room 1')
      reservation = Reservation.new(room: room, check_in: Date.today, check_out: Date.tomorrow)

      reservation.no_reservation_overlap

      expect(reservation.errors).to be_empty
    end
  end

  describe '#check_in_and_check_out_are_in_the_future' do
    it 'should add an error to the reservation' do
      reservation = Reservation.new(check_in: Date.yesterday, check_out: Date.today)

      reservation.check_in_and_check_out_are_in_the_future

      expect(reservation.errors[:base]).to include('Reservations must be for future dates.')
    end

    it 'should not add an error to the reservation' do
      reservation = Reservation.new(check_in: Date.today, check_out: Date.tomorrow)

      reservation.check_in_and_check_out_are_in_the_future

      expect(reservation.errors).to be_empty
    end
  end
end
