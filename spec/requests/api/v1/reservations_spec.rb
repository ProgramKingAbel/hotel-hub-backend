require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  let(:user) { create(:user) } # Assuming you have a user factory
  let(:room) { create(:room) } # Assuming you have a room factory

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
        reservation: {
          check_in: 1.week.from_now,  # Adjust these dates to future dates
          check_out: 2.weeks.from_now,
          room_id: room.id
        }
      }
      
      expect(response).to have_http_status(:created)
    end
    context 'with invalid parameters' do
      it 'returns unprocessable_entity status' do
        sign_in user
        post '/api/v1/reservations', params: {
          reservation: {
            check_in: '2023-10-10',
            check_out: '2023-10-15',
            room_no: room.id
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
      reservation = create(:reservation) # Assuming you have a reservation factory
      get "/api/v1/reservations/#{reservation.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      it 'updates the reservation' do
        sign_in user
        reservation = create(:reservation) # Assuming you have a reservation factory
        put "/api/v1/reservations/#{reservation.id}", params: {
          reservation: {
            check_in: '2023-10-12',
            check_out: '2023-10-17',
            room_id: room.id
          }
        }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'returns unprocessable_entity status' do
        sign_in user
        reservation = create(:reservation) # Assuming you have a reservation factory
        put "/api/v1/reservations/#{reservation.id}", params: {
          reservation: {
            check_in: '2023-10-10',
            check_out: '2023-10-05',
            room_no: room.id
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['status']).to eq('error')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the reservation' do
      sign_in user
      reservation = create(:reservation) # Assuming you have a reservation factory
      delete "/api/v1/reservations/#{reservation.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['message']).to eq('Reservation deleted successfully.')
    end

    it 'returns not_found status for non-existing reservation' do
      sign_in user
      delete "/api/v1/reservations/999" # Assuming 999 is a non-existing reservation ID
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['error']).to eq('Reservation not found.')
    end
  end
end
