class Message < ApplicationRecord
  belongs_to :user

  validates :message_content, presence: true
end
