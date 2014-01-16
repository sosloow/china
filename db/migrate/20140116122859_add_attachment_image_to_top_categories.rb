class AddAttachmentImageToTopCategories < ActiveRecord::Migration
  def self.up
    change_table :top_categories do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :top_categories, :image
  end
end
