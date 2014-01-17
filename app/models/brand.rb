class Brand < ActiveRecord::Base
  has_attached_file :image, styles: {medium: '150x150>'}

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :title, presence: true

  has_and_belongs_to_many :sub_categories
end
