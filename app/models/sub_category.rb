class SubCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  belongs_to :top_category
end
