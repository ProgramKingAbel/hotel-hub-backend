FactoryBot.define do
    factory :reservation do
      check_in { '2023-10-10' }
      check_out { '2023-10-15' }
      user # This will create a user association dynamically
      room # This will create a room association dynamically
    end
  end
  