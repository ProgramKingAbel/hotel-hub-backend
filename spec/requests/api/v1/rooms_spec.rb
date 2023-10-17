require 'rails_helper'

RSpec.describe 'Api::V1::Rooms', type: :request do
  let(:user) { create(:user) }
  
  describe 'GET /api/v1/rooms' do
    it 'returns a JSON response with a list of rooms' do
      get "/api/v1/rooms"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'creates a new room with valid parameters' do
      # Authenticate the user
      sign_in user

      # Send a POST request to the create action with valid room parameters
      post '/api/v1/rooms', params: {
        room: {
          name: 'Room 101',
          price: 100,
          description: 'A nice room',
          room_type: 'Standard'
        }
      }

      # Check the response
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq('Room successfully created')
    end

    it 'returns unprocessable_entity status with invalid parameters' do
      # Authenticate the user
      sign_in user

      # Send a POST request to the create action with invalid room parameters
      post '/api/v1/rooms', params: {
        room: {
          name: '', # Invalid: name is required
          price: 100,
          description: 'A nice room',
          room_type: 'Standard'
        }
      }

      # Check the response
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to eq('Failed to create room')
    end
  end

  describe 'GET /api/v1/rooms/:id' do
    it 'returns a JSON response with a room' do
      room = create(:room)
      get "/api/v1/rooms/#{room.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'PUT /api/v1/rooms/:id' do
  #   it 'return a JSON response of update a room' do
  #     room = create(:room)
  #     put "/api/v1/rooms/#{room.id}", params: { room: { name: 'New name' } }
  #     expect(response).to have_http_status(:no_content)
  #   end
  # end


  # describe 'DELETE /api/v1/rooms/:id' do
  #   it 'return a JSON response of delete a room' do
  #     room = create(:room)
  #     delete "/api/v1/rooms/#{room.id}"
  #     expect(response).to have_http_status(:no_content)
  #   end
  # end

end
