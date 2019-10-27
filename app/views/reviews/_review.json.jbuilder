json.extract! review, :id, :reviewee, :review_content, :review_stars, :user_id, :created_at, :updated_at
json.url review_url(review, format: :json)
