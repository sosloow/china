class CreateBrandsSubCategories < ActiveRecord::Migration
  def change
    create_table :brands_sub_categories do |t|
      t.belongs_to :brand
      t.belongs_to :sub_category
    end
  end
end
