class ProductsCategory < ActiveRecord::Base
  belongs_to :parent, :class_name => "ProductsCategory"

  has_many :subcategories, :class_name => "ProductsCategory", :foreign_key => "parent_id", :dependent => :destroy
end
