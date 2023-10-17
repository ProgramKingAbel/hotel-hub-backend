# require 'rails_helper'
# require 'swagger_helper'

# describe 'Rooms API' do
#   # let(:user) do
#   #   User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'newuser', password_confirmation: 'newuser')
#   # end
#   let(:user) { create(:user) }

#   path '/api/v1/rooms' do
#     get 'Retrieves a list of rooms' do
#       tags 'Rooms'
#       produces 'application/json'
#       parameter name: :Authorization, in: :header, type: :string

#       response '200', 'List of rooms retrieved' do
#         let(:Authorization) { "Bearer #{Devise::JWT::TestHelpers.jwt_token(user, user.class)}" }
#         run_test!
#       end
#     end

#     post 'Creates a new room' do
#       tags 'Rooms'
#       consumes 'application/json'
#       parameter name: :Authorization, in: :header, type: :string
#       parameter name: :room, in: :body, schema: {
#         type: :object,
#         properties: {
#           name: { type: :string },
#           price: { type: :number },
#           description: { type: :string },
#           image: { type: :string },
#           room_type: { type: :string }
#         },
#         required: %w[name price description image room_type]
#       }
#       let(:Authorization) { "Bearer #{Devise::JWT::TestHelpers.jwt_token(user, user.class)}" }
#       response '201', 'Created'
#       response '422', 'Unprocessable Entity'
#     end
#   end

#   path '/api/v1/rooms/{id}' do
#     parameter name: :id, in: :path, type: :string

#     get 'Retrieves a specific room by ID' do
#       tags 'Rooms'
#       produces 'application/json'
#       parameter name: :Authorization, in: :header, type: :string
#       response '200', 'OK'
#     end

#     put 'Updates a specific room by ID' do
#       tags 'Rooms'
#       consumes 'application/json'
#       parameter name: :Authorization, in: :header, type: :string
#       parameter name: :room, in: :body, schema: {
#         type: :object,
#         properties: {
#           name: { type: :string },
#           price: { type: :number },
#           description: { type: :string },
#           image: { type: :string },
#           room_type: { type: :string }
#         }
#       }
#       let(:Authorization) { "Bearer #{Devise::JWT::TestHelpers.jwt_token(user, user.class)}" }
#       response '200', 'OK'
#       response '422', 'Unprocessable Entity'
#     end

#     delete 'Deletes a specific room by ID' do
#       tags 'Rooms'
#       parameter name: :Authorization, in: :header, type: :string
#       response '204', 'No Content'
#     end
#   end
# end
