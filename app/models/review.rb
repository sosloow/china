class Review < ActiveRecord::Base
  has_attached_file :photo, styles: {medium: '120x120>'}

  attr_accessor :delete_photo
  before_validation { self.image.clear if self.delete_photo == '1' }

  validates :name, presence: true
  validates :body, presence: true
  validates_attachment :photo, content_type: {content_type:
    ["image/jpg", "image/jpeg", "image/gif", "image/png"]}
end
