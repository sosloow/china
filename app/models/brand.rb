class Brand < ActiveRecord::Base
  has_attached_file :image

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :title, presence: true
  validates :body, presence: true
end
