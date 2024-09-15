class User < ApplicationRecord
  has_secure_password

  normalizes :email, with: ->(email) { email.strip.downcase }

  validates :email, uniqueness: true

  encrypts :email, deterministic: true
end
