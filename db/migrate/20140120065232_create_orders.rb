class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.text :question

      t.timestamps
    end
  end
end
