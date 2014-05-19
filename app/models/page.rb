class Page < ActiveRecord::Base
  translates :title, :body do
    validates :title, presence: true
    validates :body, presence: true
  end

  has_many :page_translations
  accepts_nested_attributes_for :page_translations
end
