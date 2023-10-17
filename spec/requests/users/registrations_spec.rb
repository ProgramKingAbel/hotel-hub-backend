require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  path '/users/' do
    post('create registration') do
      tags 'User Registrations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string }
            },
            required: %w[name email password password_confirmation]
          }
        }
      }

      response(200, 'successful') do
        let(:user) do
          { name: 'testing1', email: 'test@example.com', password: 'password', password_confirmation: 'password' }
        end

        run_test!
      end
    end
  end
end
