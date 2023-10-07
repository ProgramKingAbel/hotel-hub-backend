require 'rails_helper'


describe User do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name)}
  
    it 'should have a valid email address' do
      user = User.new(name: 'John Doe', email: 'invalid_email_address')
  
      expect(user).not_to be_valid
    end
  
    it 'should have a unique email address' do
      user_1 = User.create(name: 'John Doe', email: 'john.doe@example.com')
      user_2 = User.new(name: 'Jane Doe', email: 'john.doe@example.com')
  
      expect(user_2).not_to be_valid
    end
  end