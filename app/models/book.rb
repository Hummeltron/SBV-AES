class Book < ActiveRecord::Base
    def self.search(search)
        where("isbn LIKE ? OR label LIKE ?", "%#{search}%", "%#{search}%")
    end
end
