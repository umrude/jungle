# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password
<<<<<<< HEAD

  validates :name, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    if user && user.authenticate(password)
      user
    else 
      nil
    end
=======
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    user if user&.authenticate(password)
>>>>>>> efdf1b553b0c5d83adc6631b55a82318cb0c63ab
  end
end
