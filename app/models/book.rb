class Book < ActiveRecord::Base
    mount_uploader :image, AttachmentUploader
    
    validates_presence_of :label
    validates_presence_of :isbn
    validates_numericality_of :price
    
    def self.search(search)
        where("isbn LIKE ? OR label LIKE ?", "%#{search}%", "%#{search}%")
    end
end
