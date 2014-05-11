class Document < ActiveRecord::Base
  has_attached_file :file

  translates :title, :description do
    validates :title, presence: true
  end

  validates_attachment :file, :presence => true
  has_many :document_translations
  accepts_nested_attributes_for :document_translations
end

