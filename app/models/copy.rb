class Copy < ActiveRecord::Base
	belongs_to :book
	belongs_to :student

	validates_presence_of :book_id
	validates_presence_of :student_id
	validates_presence_of :code
	validates_numericality_of :code

	def self.search(search)
		where("code LIKE ?", "%#{search}%")
	end
end
