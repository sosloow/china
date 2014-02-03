class Product < ActiveRecord::Base

  has_attached_file :image, styles: {medium: '115x115>'}

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :title, presence: true
  validates :description, presence: true
  #validates_attachment :image, content_type: {content_type:
    #["image/jpg", "image/gif", "image/png"]}

  belongs_to :sub_category
  belongs_to :brand
end
