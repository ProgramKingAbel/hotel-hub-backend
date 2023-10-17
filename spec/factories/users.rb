FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "user#{n}@example.com" }        
        password { 'password123' }
        sequence(:name) { |n| "User#{n}" }
        role { 'admin' } # Add the role column here
      end
  end
  