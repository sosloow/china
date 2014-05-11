class Product < ActiveRecord::Base

  has_attached_file :image, styles: {medium: '115x115>'}

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  translates :title, :description do
    validates :title, presence: true
    validates :description, presence: true
  end

  #validates_attachment :image, content_type: {content_type:
    #["image/jpg", "image/gif", "image/png"]}

  belongs_to :sub_category
  belongs_to :brand
  has_many :product_translations
  accepts_nested_attributes_for :product_translations
end

