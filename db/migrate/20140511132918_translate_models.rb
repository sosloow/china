class TranslateModels < ActiveRecord::Migration
  def self.up
    Brand.create_translation_table!({
      :title => :string,
      :description => :text
    }, {
      :migrate_data => true
    })

    Document.create_translation_table!({
      :title => :string,
      :description => :text
    }, {
      :migrate_data => true
    })

    Product.create_translation_table!({
      :title => :string,
      :description => :text
    }, {
      :migrate_data => true
    })

    QuestionCategory.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })

    Question.create_translation_table!({
      :title => :string,
      :body => :text
    }, {
      :migrate_data => true
    })

    Review.create_translation_table!({
      :name => :string,
      :body => :text
    }, {
      :migrate_data => true
    })

    Service.create_translation_table!({
      :name => :string,
      :body => :text
    }, {
      :migrate_data => true
    })

    SubCategory.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })

    TopCategory.create_translation_table!({
      :title => :string
    }, {
      :migrate_data => true
    })    
  end

  def self.down
    Brand.drop_translation_table! :migrate_data => true
    Document.drop_translation_table! :migrate_data => true
    Product.drop_translation_table! :migrate_data => true
    QuestionCategory.drop_translation_table! :migrate_data => true
    Question.drop_translation_table! :migrate_data => true
    Review.drop_translation_table! :migrate_data => true
    Service.drop_translation_table! :migrate_data => true
    SubCategory.drop_translation_table! :migrate_data => true
    TopCategory.drop_translation_table! :migrate_data => true
  end
end
