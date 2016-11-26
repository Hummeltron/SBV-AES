class Classname < ActiveRecord::Base
  def full_name
    "#{self.name}-#{self.year}".strip
  end
  
  def self.search(search)
    where("name LIKE ? OR year LIKE ?", "%#{search}%", "%#{search}%")
  end
end
