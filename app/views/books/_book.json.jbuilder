json.extract! book, :id, :label, :paid, :created_at, :updated_at
json.url book_url(book, format: :json)