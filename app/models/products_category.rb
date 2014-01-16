class ProductsCategory < ActiveRecord::Base
  has_attached_file :image

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :title, presence: true

  belongs_to :parent, :class_name => "ProductsCategory"

  has_many :subcategories, :class_name => "ProductsCategory", :foreign_key => "parent_id", :dependent => :destroy
  has_many :products
end
