class User < ApplicationRecord
  validates :username, presence: true
  validates :username, length: { minimum: 3, maximum: 15 }
  validates :username, uniqueness: true

  has_many :messages

  has_secure_password
end
