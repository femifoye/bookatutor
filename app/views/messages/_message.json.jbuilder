json.extract! message, :id, :message_to, :message_from, :status, :user_id, :created_at, :updated_at
json.url message_url(message, format: :json)
