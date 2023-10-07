# spec/models/room_spec.rb

require 'rails_helper'

RSpec.describe Room, type: :model do
  # Test validations
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }

  # Test associations
  it { is_expected.to have_many(:reservations) }
end
