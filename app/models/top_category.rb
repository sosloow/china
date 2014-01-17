class TopCategory < ActiveRecord::Base
  has_attached_file :image, styles: {medium: '150x150>'}

  validates :title, presence: true
  validates_attachment :image, content_type: {content_type:
    ["image/jpg", "image/gif", "image/png"]}

  has_many :sub_categories
end
