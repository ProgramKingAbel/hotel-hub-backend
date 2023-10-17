require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  let(:user) { create(:user) } # Assuming you have a user factory
  let(:room) { create(:room) } # Assuming you have a room factory
  let(:reservation) {create(:reservation)}

  describe 'GET #index' do
    it 'returns a success response' do
      sign_in user
      get '/api/v1/reservations'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates a new reservation with valid parameters' do
      post '/api/v1/reservations', params: {
        reservation: :reservation
      }
    end
    context 'with invalid parameters' do
      it 'returns unprocessable_entity status' do
        sign_in user
        post '/api/v1/reservations', params: {
          reservation: {
            check_in: '2023-12-10',
            check_out: '2023-12-13',
            room_no: room.id,
            user_id: user.id
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['status']).to eq('error')
      end
    end

  end

  describe 'GET #show' do
  it 'returns a success response' do
    sign_in user
    reservation = create(:reservation, user: user) # Create a reservation associated with the current user
    get "/api/v1/reservations/#{reservation.id}"
    expect(response).to have_http_status(:success)
  end
  end

  
end
