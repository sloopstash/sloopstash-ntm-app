class User < ApplicationRecord
  has_secure_password
  has_many :notes



   # Define virtual attributes for password confirmation
  attr_accessor :confirm_password
  validates_confirmation_of :password
  
  # Validate presence, uniqueness, and format of the username attribute.
  validates :username, presence: true, uniqueness: true
  
  # Validate presence and minimum length (6 characters) of the password attribute.
  validates :password, presence: true, length: { minimum: 6 }
  validates :confirm_password, presence: true

  # Validate presence and format (using a regular expression for email format) of the email attribute.
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Custom validation method to ensure that the password confirmation matches the password.
  validate :password_match

  private
  
  # Custom validation method implementation to check if the password confirmation matches the password.
  def password_match
    errors.add(:confirm_password, "doesn't match password") unless password == confirm_password
  end
end