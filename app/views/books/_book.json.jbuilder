json.extract! book, :id, :label, :price, :isbn, :image, :created_at, :updated_at
json.url book_url(book, format: :json)