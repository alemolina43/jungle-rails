require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'must be created with password and password confirmation' do
      @user = User.new(
        name: "Alice",
        last_name: "Smith",
        email: "alice@example.com",
        password: "hello123",
        password_confirmation: "hello123"
      )
      expect(@user).to be_valid
    end

    it 'must be created with password and password confirmation' do
      @user = User.new(
        name: "Alice",
        last_name: "Smith",
        email: "alice@example.com",
        password: nil,
        password_confirmation: "hello123"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    it 'password and password confirmation should match' do
      @user = User.new(
        name: "Alice",
        last_name: "Smith",
        email: "alice@example.com",
        password: "hello123",
        password_confirmation: "goodbye123"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'email must be unique' do
      User.create!(
        name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )

      @user = User.new(
        name: "Jane",
        last_name: "Smith",
        email: "TEST@EXAMPLE.COM",
        password: 'hello123',
        password_confirmation: 'hello123'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it 'password must be at least 8 characters long' do
      @user = User.new(
        name: "Alice",
        last_name: "Smith",
        email: "alice@example.com",
        password: "hello",
        password_confirmation: "hello"
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should login a user with valid email and password' do
      user = User.create!(
        name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      attempt = User.authenticate_with_credentials("test@example.com", "password")
      expect(attempt).to eq(user)
    end
    
    it 'should authenticate a user if email contains trailing spaces' do
      user = User.create!(
        name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      attempt = User.authenticate_with_credentials("   test@example.com   ", "password")
      expect(attempt).to eq(user)
    end

    it 'should authenticate if user types wrong case' do
      user = User.create!(
        name: "John",
        last_name: "Doe",
        email: "test@example.com",
        password: "password",
        password_confirmation: "password"
      )
      attempt = User.authenticate_with_credentials("Test@example.com", "password")
      expect(attempt).to eq(user)
    end
  end

end







# puts @user.errors.full_messages
# Password can't be blank
# Password confirmation doesn't match Password
# Password is too short (minimum is 4 characters)
# Email has already been taken
# Password confirmation doesn't match Password