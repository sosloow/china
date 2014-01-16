class CreateTopCategories < ActiveRecord::Migration
  def change
    create_table :top_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
