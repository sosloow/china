class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.references :products_category, index: true

      t.timestamps
    end
  end
end
