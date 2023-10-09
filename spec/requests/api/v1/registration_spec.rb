require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController do
    describe 'POST /api/v1/users' do
        it 'should create a new user' do
          post '/api/v1/users', params: { user: { name: 'John Doe', email: 'john.doe@example.com', password: 'password', password_confirmation: 'password' } }
      
          expect(response).to have_http_status(:created)
      
          # Parse the JSON response
          parsed_response = JSON.parse(response.body)
      
          expect(parsed_response['name']).to eq('John Doe')
          expect(parsed_response['email']).to eq('john.doe@example.com')
        end
      
        it 'should return an error if the user cannot be created' do
          post '/api/v1/users', params: { user: { name: '', email: 'invalid_email_address', password: 'password', password_confirmation: 'password' } }
      
          expect(response).to have_http_status(:unprocessable_entity)
      
          # Parse the JSON response
          parsed_response = JSON.parse(response.body)
      
          expect(parsed_response['errors']).to include('Name is too short (minimum is 3 characters)')
          expect(parsed_response['errors']).to include('Email is not an email')
        end
    end   
end
