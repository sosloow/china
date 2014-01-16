class Product < ActiveRecord::Base
  has_attached_file :image

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :title, presence: true
  validates :description, presence: true

  belongs_to :sub_category
end
