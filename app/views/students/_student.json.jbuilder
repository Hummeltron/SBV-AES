json.extract! student, :id, :name, :surname, :birth, :classname_id, :price, :created_at, :updated_at
json.url student_url(student, format: :json)