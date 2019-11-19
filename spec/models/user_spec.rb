require 'rails_helper'

RSpec.describe User, type: :model do

    describe 'Validations' do
      subject { User.new(
          first_name: 'first', 
          last_name: 'last', 
          email: "test@test.com", 
          password: 'password', 
          password_confirmation: 'password') 
        }
          
        it "is valid with valid attributes" do
            expect(subject).to be_valid        
        end

        it "is not valid without a email" do
        subject.email = nil
        expect(subject).to_not be_valid
        expect(subject.errors[:email]).to_not be_empty
        end
    
        it "is not valid without a first name" do
        subject.first_name = nil
        expect(subject).to_not be_valid
        expect(subject.errors[:first_name]).to_not be_empty
        end

        it "is not valid without a last name" do
        subject.last_name = nil
        expect(subject).to_not be_valid
        expect(subject.errors[:last_name]).to_not be_empty
        end

        it "is not valid with a password less than the minimum length" do
        subject.password = "ggeo"
        expect(subject).to_not be_valid
        expect(subject.errors[:password]).to_not be_empty
        end
    end

    describe '.authenticate_with_credentials' do
    let!(:user) { described_class.create!(first_name: "here", last_name: "there", email: "test@test.com", password: "12345678", password_confirmation: "12345678") }

    it "is valid with correct password" do
      result = User.authenticate_with_credentials("test@test.com", "12345678")
      expect(result).to be_present
    end

    it "is not valid with incorrect password" do
      result = User.authenticate_with_credentials(" mi@test.com ", "12345678")
      expect(result).to be_nil
    end

    it "is valid with correct password with space" do
      result = User.authenticate_with_credentials(" test@test.com ", "12345678")
      expect(result).to be_present
    end
    
    it "is valid with correct password with uppercase" do
      result = User.authenticate_with_credentials(" test@tEsT.com ", "12345678")
      expect(result).to be_present
    end 
  end
end