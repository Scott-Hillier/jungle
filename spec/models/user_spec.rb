require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'ensures user has a password' do
      user = User.create(name: "name", email: "example@email.com", password: nil, password_confirmation: "password")
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwords match' do
      user = User.create(name: "name", email: "example@email.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end

    it 'passwords match' do
      user = User.create(name: "name", email: "example@email.com", password: "password", password_confirmation: "not_password")
      expect(user).to_not be_valid
    end

    it 'two emails are the same' do
      user = User.create(name: "name", email: "example@.email.com", password: "password", password_confirmation: "password")
      user2 = User.create(name: "name", email: "EXAMPLE@.email.com", password: "password", password_confirmation: "password")
      expect(user2.email).to_not equal(user.email)
    end

    it 'ensures user has an email' do
      user = User.create(name: "name", email: nil, password: "password", password_confirmation: "password")
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'ensures user has a first and last name' do
      user = User.create(name: "name name", email: "example@email.com", password: "password", password_confirmation: "password")
      expect(user.name).to include(" ")
    end

    it 'password length greater than 2 characters' do
      user = User.create(name: "name", email: "example@email.com", password: "pa", password_confirmation: "pa")
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it 'login valid user' do
      user1 = User.create(name: 'name', email: 'example@email.com', password: 'password', password_confirmation: 'password')
      user2 = User.authenticate_with_credentials(user1.email, user1.password)
      expect(user2.id).to be user1.id
    end

    it 'login valid user with spaces in email' do
      user1 = User.create(name: 'name', email: 'example@email.com', password: 'password', password_confirmation: 'password')
      user2 = User.authenticate_with_credentials(' example@email.com ', user1.password)
      expect(user2.id).to be user1.id
    end

    it 'login valid user with capitals in email' do
      user1 = User.create(name: 'name', email: 'example@email.com', password: 'password', password_confirmation: 'password')
      user2 = User.authenticate_with_credentials('EXAMPLE@email.com', user1.password)
      expect(user2.id).to be user1.id
    end

  end
end
