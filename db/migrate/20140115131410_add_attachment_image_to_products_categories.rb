class AddAttachmentImageToProductsCategories < ActiveRecord::Migration
  def self.up
    change_table :products_categories do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :products_categories, :image
  end
end
