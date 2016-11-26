class Copy < ActiveRecord::Base
  belongs_to :book
  belongs_to :student
  
  def self.search(search)
    where("code LIKE ?", "%#{search}%")
  end
end
