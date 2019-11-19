# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      User.new(
        id: 1,
        name: 'first',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a first name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a password less than the minimum length' do
      subject.password = 'ggeo'
      expect(subject).to_not be_valid
    end

    context 'should not have 2 users with same email' do
      let! (:user2) { User.create(name: 'user2', email: 'test@TEST.com', password: '12345', password_confirmation: '12345') }

      it { is_expected.to_not be_valid }
    end
  end

  describe '.authenticate_with_credentials' do
    let!(:user) { User.create!(name: 'Gabi', email: 'test@test.com', password: 'password', password_confirmation: 'password') }

    it 'is valid with correct password' do
      result = User.authenticate_with_credentials('test@test.com', 'password')
      expect(result).to be_present
    end

    it 'is not valid with incorrect password' do
      result = User.authenticate_with_credentials(' mi@test.com ', 'password')
      expect(result).to be_nil
    end

    it 'is valid with correct password with space' do
      result = User.authenticate_with_credentials(' test@test.com ', 'password')
      expect(result).to be_present
    end

    it 'is valid with correct password with uppercase' do
      result = User.authenticate_with_credentials(' test@tEsT.com ', 'password')
      expect(result).to be_present
    end
  end
end
