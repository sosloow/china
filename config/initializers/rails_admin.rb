RailsAdmin.config do |config|
  config.current_user_method { current_user } #auto-generated
  require 'i18n'
  I18n.default_locale = :ru

  config.model 'City' do
    visible false
    weight 10
    list do
      field :query
      field :latitude
      field :longitude
    end
  end

  config.model 'Question' do
    parent 'QuestionCategory'
    weight 6
    edit do
      exclude_fields :title, :body
    end
    list do
      field :title
      field :body
      field :question_category
    end
  end

  config.model 'QuestionTranslation' do
    object_label_method :locale
    visible false
    edit do
      include_all_fields
      field :body, :ck_editor
      exclude_fields :question
    end
  end

  config.model 'QuestionCategory' do
    weight 5
    edit do
      exclude_fields :title
    end
    list do
      field :title
      field :questions
    end
  end

  config.model 'QuestionCategoryTranslation' do
    object_label_method :locale
    visible false
    edit do
      exclude_fields :question_category
    end
  end

  config.model 'Brand' do
    weight 3
    edit do
      exclude_fields :title, :description
    end
    list do
      field :title
      field :description
      field :image
      field :sub_categories
    end
  end

  config.model 'BrandTranslation' do
    object_label_method :locale
    visible false
    edit do
      include_all_fields
      field :description, :ck_editor
      exclude_fields :brand
    end
  end

  config.model 'Document' do
    weight 9
    edit do
      exclude_fields :title, :description
    end
    list do
      field :title
      field :description
      field :file
    end
  end

  config.model 'DocumentTranslation' do
    object_label_method :locale
    visible false
    edit do
      include_all_fields
      field :description, :ck_editor
      exclude_fields :document
    end
  end

  config.model 'Order' do
    weight -1
    list do
      field :name
      field :phone
      field :question
      field :created_at
    end
  end

  config.model 'Product' do
    parent 'Brand'
    edit do
      exclude_fields :title, :description
    end
    list do
      field :title
      field :description
      field :image
      field :sub_category
      field :brand
    end
  end

  config.model 'ProductTranslation' do
    object_label_method :locale
    visible false
    edit do
      include_all_fields
      field :description, :ck_editor
      exclude_fields :product
    end
  end

  config.model 'Review' do
    weight 7
    edit do
      exclude_fields :name, :body
    end
    list do
      field :name
      field :photo
      field :body
    end
  end

  config.model 'ReviewTranslation' do
    object_label_method :locale
    visible false
    edit do
      include_all_fields
      field :body, :ck_editor
      exclude_fields :review
    end
  end

  config.model 'Service' do
    weight 8
    edit do
      exclude_fields :name, :body
    end
    list do
      field :name
      field :body
    end
  end

  config.model 'ServiceTranslation' do
    object_label_method :locale
    visible false
    edit do
      include_all_fields
      field :body, :ck_editor
      exclude_fields :service
    end
  end

  config.model 'SubCategory' do
    parent 'TopCategory'
    edit do
      exclude_fields :title
    end
    list do
      field :title
      field :top_category
      field :brands
    end
  end

  config.model 'SubCategoryTranslation' do
    object_label_method :locale
    visible false
    edit do
      exclude_fields :sub_category
    end
  end

  config.model 'TopCategory' do
    weight 1
    edit do
      exclude_fields :title
    end
    list do
      field :title
      field :image
      field :sub_categories
    end
  end

  config.model 'TopCategoryTranslation' do
    object_label_method :locale
    visible false
    edit do
      exclude_fields :top_category
    end
  end

  config.model 'User' do
    weight 12
  end

  config.model 'Page' do
    weight -2
    edit do
      exclude_fields :body
    end
    list do
      field :title
      field :body
      field :link
    end
  end

  config.model 'PageTranslation' do
    object_label_method :locale
    visible false
    edit do
      include_all_fields
      field :body, :ck_editor
      exclude_fields :page
    end
  end
end
