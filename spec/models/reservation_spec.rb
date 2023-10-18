require 'rails_helper'
require 'factory_bot'

RSpec.describe Reservation, type: :model do
  # Include FactoryBot methods
  include FactoryBot::Syntax::Methods

  describe '#no_reservation_overlap' do
    it 'should add an error to the reservation when the same room is reserved twice' do
      room = create(:room) # Use FactoryBot create to create a room

      create(:reservation, room:, check_in: Date.today, check_out: Date.tomorrow)
      reservation = build(:reservation, room:, check_in: Date.today, check_out: Date.tomorrow + 1)
      reservation.save

      expect(reservation.errors[:base]).to include('This room is already reserved during that time.')
    end

    it 'should not add an error to the reservation' do
      room = create(:room) # Use FactoryBot create to create a room
      reservation = build(:reservation, room:, check_in: Date.today, check_out: Date.tomorrow)
      reservation.save

      expect(reservation.errors[:base]).to_not include('This room is already reserved during that time.')
    end
  end
end
