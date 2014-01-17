class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.belongs_to :sub_category
      t.belongs_to :brand

      t.timestamps
    end
  end
end
