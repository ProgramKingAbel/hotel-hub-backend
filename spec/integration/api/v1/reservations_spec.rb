require 'rails_helper'
require 'swagger_helper'

describe 'Reservations API' do
  let!(:user) { create(:user) }

  path '/api/v1/reservations' do
    get 'Retrieves a list of reservations for current user' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'List of reservations retrieved' do
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        run_test!
      end
    end

    post 'Creates a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :reservation, in: :body, schema: { type: :object,
                                                         properties: { check_in: { type: :string, format: 'date' },
                                                                       check_out: { type: :string, format: 'date' },
                                                                       room_id: { type: :integer } },
                                                         required: %w[check_in check_out room_id] }

      response '201', 'Reservation created successfully' do
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:reservation) { { check_in: '2023-11-01', check_out: '2023-11-03', room_id: 1 } }
        run_test!
      end

      response '422', 'Validation errors' do
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:reservation) { { check_in: 'invalid_date', check_out: 'invalid_date', room_id: nil } }
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    before { Warden.test_mode! }

    get 'Retrieves a single reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, in: :path, type: :integer

      response '200', 'Reservation retrieved' do
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:id) { create(:reservation, user:).id }
        run_test!
      end

      response '404', 'Reservation not found' do
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:id) { 9999 } # An ID that doesn't exist
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    delete 'Deletes a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, in: :path, type: :integer

      response '200', 'Reservation deleted successfully' do
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:id) { create(:reservation, user:).id }
        run_test!
      end

      response '404', 'Reservation not found' do
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:id) { 999 } # An ID that doesn't exist
        run_test!
      end
    end
  end
end
