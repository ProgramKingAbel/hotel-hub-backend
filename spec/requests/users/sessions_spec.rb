require 'swagger_helper'

RSpec.describe 'users/sessions', type: :request do
  path '/users/sign_in' do
    post('create session') do
      tags 'User Sessions'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
            },
            required: %w[email password]
          }
        }
      }

      response(200, 'successful') do
        let(:user) {
          {
            user: {
              email: 'test@example.com',
              password: 'password'
            }
          }
        }

        run_test!
      end

      response(401, 'unauthorized') do
        let(:user) {
          {
            user: {
              email: 'test@example.com',
              password: 'incorrect_password'
            }
          }
        }

        run_test!
      end
    end
  end

  path '/users/sign_out' do
    delete('destroy session') do
      tags 'User Sessions'
      consumes 'application/json'
      produces 'application/json'

      # Describe the expected request structure in the Swagger documentation
      parameter name: 'Authorization', in: :header, type: :string, required: true

      response(200, 'successful') do
        description 'Successfully signed out'
        run_test!
      end

      response(401, 'unauthorized') do
        description 'Unauthorized sign-out request'
      end
    end
  end
end