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

    describe 'PUT #update' do
    context 'with valid parameters' do
      it 'updates the reservation' do
        sign_in user
        reservation = create(:reservation, user: user) # Assuming you have a reservation factory

        put "/api/v1/reservations/#{reservation.id}", params: {
          reservation: {
            check_in: '2023-12-10',
            check_out: '2024-1-17',
            room_id: room.id
          }
        }
        # Reload the reservation from the database to get the updated attributes
        reservation.reload
        expect(reservation.check_in.to_date).to eq(Date.parse('2023-12-10'))
        expect(reservation.check_out.to_date).to eq(Date.parse('2024-1-17'))
        expect(reservation.room_id).to eq(room.id)
      end
    end
    context 'with invalid parameters' do
      it 'returns unprocessable_entity status' do
        sign_in user
        reservation = create(:reservation, user: user, room: room) # Assuming you have a reservation factory

        put "/api/v1/reservations/#{reservation.id}", params: {
          reservation: {
            check_in: '2023-10-10',
            check_out: '2023-10-05',
            room_no: room.id
          }
        }

        expect(response).to have_http_status(:unprocessable_entity)

        # Reload the reservation from the database to ensure it hasn't been updated
        reservation.reload
        expect(reservation.check_in.to_date).not_to eq(Date.parse('2023-10-10'))
        expect(reservation.check_out.to_date).not_to eq(Date.parse('2023-10-05'))
      end
    end

  end
  describe 'DELETE #destroy' do
  it 'destroys the reservation' do
    sign_in user
    reservation = create(:reservation, user: user) # Assuming you have a reservation factory
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
