RailsAdmin.config do |config|

  config.current_user_method { current_user } #auto-generated
  require 'i18n'
  I18n.default_locale = :ru

  config.model 'City' do
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
    list do
      field :title
      field :body
      field :question_category
    end
  end

  config.model 'QuestionCategory' do
    weight 5
    list do
      field :title
      field :questions
    end
  end

  config.model 'Brand' do
    weight 3
    list do
      field :title
      field :description
      field :image
      field :sub_categories
    end
  end

  config.model 'Document' do
    weight 9
    list do
      field :title
      field :description
      field :file
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
    weight 4
    list do
      field :title
      field :description
      field :image
      field :sub_category
      field :brand
    end
  end

  config.model 'Review' do
    weight 7
    list do
      field :name
      field :photo
      field :body
    end
  end

  config.model 'Service' do
    weight 8
    list do
      field :name
      field :body
    end
  end

  config.model 'SubCategory' do
    parent 'TopCategory'
    weight 2
    list do
      field :title
      field :top_category
      field :brands
    end
  end

  config.model 'TopCategory' do
    weight 1
    list do
      field :title
      field :image
      field :sub_categories
    end
  end

  config.model 'User' do
    weight 12
  end
end
