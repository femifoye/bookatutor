json.extract! student, :id, :education_level, :description, :subjects_of_interest, :user_id, :created_at, :updated_at
json.url student_url(student, format: :json)
