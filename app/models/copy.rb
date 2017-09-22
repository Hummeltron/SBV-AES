class Copy < ActiveRecord::Base
	belongs_to :book
	belongs_to :student

	validates_presence_of :book_id
	validates_presence_of :student_id

	def self.search(search)
		where("code LIKE ?", "%#{search}%")
	end
end
