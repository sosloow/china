class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :question_categories do |t|
      t.string :title

      t.timestamps
    end
  end
end
