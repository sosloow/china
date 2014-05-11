class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  has_attached_file :image, styles: {medium: '150x150>'}

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }


  translates :title, :description do
    validates :title, presence: true
  end

  validates_attachment :image, content_type: {content_type:
    ["image/jpg", "image/jpeg", "image/gif", "image/png"]}

  has_many :products
  has_many :brand_translations
  accepts_nested_attributes_for :brand_translations
  has_many :sub_categories, through: :products
end

