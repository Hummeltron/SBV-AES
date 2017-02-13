class Classname < ActiveRecord::Base
	validates_presence_of :name

	has_many :students

	def full_name
		"#{self.name}-#{self.year}".strip
	end

	def self.search(search)
		where("name LIKE ? OR year LIKE ?", "%#{search}%", "%#{search}%")
	end
end
