class SubCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  belongs_to :top_category
  has_and_belongs_to_many :brands
end
