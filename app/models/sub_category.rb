class SubCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  belongs_to :top_category
  has_many :products
  has_many :brands, through: :products
end
