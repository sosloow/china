class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  has_attached_file :image, styles: {medium: '150x150>'}

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :title, presence: true

  has_many :products
  has_many :sub_categories, through: :products
end
