require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
 
    context 'with valid params' do
      it 'creates a new reservation' do
        user = create(:user)
        room = create(:room)
          post :create, params: { reservation: reservation ={
            check_in: '2023-10-10',
            check_out: '2023-10-15',
            user_id: user.id,
            room_id: room.id,
          } }
          expect(response).to have_http_status(:created)

      end
    end
    end
  end

  # describe 'GET #show' do
  #   it 'returns a success response' do
  #     reservation = create(:reservation) # Assuming you have FactoryBot set up
  #     get :show, params: { id: reservation.to_param }
  #     expect(response).to be_v
  #   end
  # end

  # describe 'PUT #update' do
  #   context 'with valid params' do
  #     it 'updates the reservation' do
  #       reservation = create(:reservation)
  #       new_check_in_date = reservation.check_in + 1.day
  #       put :update, params: { id: reservation.to_param, reservation: { check_in: new_check_in_date } }
  #       reservation.reload
  #       expect(reservation.check_in).to eq(new_check_in_date)
  #       expect(response).to be_successful
  #     end
  #   end

  #   context 'with invalid params' do
  #     it 'returns unprocessable_entity status' do
  #       reservation = create(:reservation)
  #       put :update, params: { id: reservation.to_param, reservation: { check_in: nil } }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it 'destroys the reservation' do
  #     reservation = create(:reservation)
  #     expect do
  #       delete :destroy, params: { id: reservation.to_param }
  #     end.to change(Reservation, :count).by(-1)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # private

  def valid_params
    
  end
  
  def invalid_params
    {
      reservation: {
        check_in: '2023-10-10',
        check_out: '2023-10-15',
        room_no: 1,
        user_id: 3
      }
    }
  end
end
