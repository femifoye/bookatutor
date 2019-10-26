json.extract! payment, :id, :amount, :receiver, :refunded, :completed, :user_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
