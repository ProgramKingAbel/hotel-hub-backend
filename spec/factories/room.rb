FactoryBot.define do
    factory :room do
        name { 'Room 1' }
        price { 100 }
        description { 'A comfortable room' }
        room_type {'Standard'}
    end
end