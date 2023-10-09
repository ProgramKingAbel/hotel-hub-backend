FactoryBot.define do
    factory :user do
        email { 'user@example.com' }
        password { 'password123' }
        name { 'John' }
    end
  end
  