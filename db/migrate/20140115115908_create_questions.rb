class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.references :question_category, index: true

      t.timestamps
    end
  end
end
