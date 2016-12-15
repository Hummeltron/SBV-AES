class Student < ActiveRecord::Base
  belongs_to :classname
  has_many :copies
  
  validates_presence_of :name
  validates_presence_of :surname
  validates_presence_of :classname_id
  validates_numericality_of :price
  
  def full_name
    "#{self.name} #{self.surname}".strip
  end
  
  def self.search(search)
    where("name LIKE ? OR surname LIKE ? OR birth LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
