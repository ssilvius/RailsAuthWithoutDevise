class User < ApplicationRecord
  has_secure_password
  normalizes :email, with: ->(email) { email.strip.downcase }
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  encrypts :email, deterministic: true

  has_many :sessions, dependent: :destroy
end
