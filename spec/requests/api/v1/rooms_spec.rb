require 'rails_helper'

RSpec.describe 'Api::V1::Rooms', type: :request do
  describe 'GET /api/v1/rooms' do
    it 'returns a JSON response with a list of rooms' do
      get "/api/v1/rooms"
      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'POST /api/v1/rooms'  do
  #   it "return succes when room is created" do
  #     post "/api/v1/rooms", params: { room: room }
  #     expect(response).to have_http_status(:created)
  #   end

      #it "return error when room is not created" do
      #post "/api/v1/rooms", params: { room: #room }
      #expect(response).to have_http_status(:unprocessable_entity)
      #end
  # end

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
