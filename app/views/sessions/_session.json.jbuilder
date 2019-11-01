json.extract! session, :id, :start, :end, :members, :references, :created_at, :updated_at
json.url session_url(session, format: :json)
