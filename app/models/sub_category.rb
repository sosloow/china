class SubCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  translates :title do
    validates :title, presence: true
  end

  belongs_to :top_category
  has_many :products
  has_many :brands, through: :products
  has_many :sub_category_translations
  accepts_nested_attributes_for :sub_category_translations
end

