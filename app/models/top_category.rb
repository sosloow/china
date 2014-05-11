class TopCategory < ActiveRecord::Base
  has_attached_file :image, styles: {medium: '150x150>'}

  translates :title do
    validates :title, presence: true
  end

  validates_attachment :image, content_type: {content_type:
    ["image/jpg", "image/gif", "image/png"]}

  has_many :sub_categories
  has_many :top_category_translations
  accepts_nested_attributes_for :top_category_translations
end

