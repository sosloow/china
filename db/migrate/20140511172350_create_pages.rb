class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :link

      Page.create_translation_table! title: :string, body: :text

      t.timestamps
    end
  end
end
