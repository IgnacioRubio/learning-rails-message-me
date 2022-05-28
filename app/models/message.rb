class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates_associated :user
end
