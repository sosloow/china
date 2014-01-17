class Document < ActiveRecord::Base
  has_attached_file :file

  validates_attachment :file, :presence => true
end
