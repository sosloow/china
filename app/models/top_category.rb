class TopCategory < ActiveRecord::Base
  has_attached_file :image, styles: {medium: '150x150>'}

  has_many :sub_categories
end
