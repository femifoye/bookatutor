class Message < ApplicationRecord
  belongs_to :user

  validates :message_to, :message_content, presence: true
end
