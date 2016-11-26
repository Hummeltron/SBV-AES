class Student < ActiveRecord::Base
  belongs_to :classname
  def full_name
    "#{self.name} #{self.surname}".strip
  end
  
  def self.search(search)
    where("name LIKE ? OR surname LIKE ? OR birth LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
