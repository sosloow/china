class CreateProductsCategories < ActiveRecord::Migration
  def change
    create_table :products_categories do |t|
      t.string :title
      t.text :description
      t.references :parent, index: true

      t.timestamps
    end
  end
end
