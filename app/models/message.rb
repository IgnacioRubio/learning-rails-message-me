class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates_associated :user

  scope :custom_display, -> { order(:created_at).last(20) }
end
