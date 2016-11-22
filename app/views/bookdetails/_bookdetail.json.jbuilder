json.extract! bookdetail, :id, :ISBN, :Leihbuch, :imgpath, :preis, :created_at, :updated_at
json.url bookdetail_url(bookdetail, format: :json)