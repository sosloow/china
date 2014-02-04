RailsAdmin.config do |config|

  config.current_user_method { current_user } #auto-generated
  require 'i18n'
  I18n.default_locale = :ru

  config.model 'City' do
    list do
      field :query
      field :latitude
      field :longitude
    end
  end

  config.model 'Question' do
    list do
      field :title
      field :body
      field :question_category
    end
  end

  config.model 'Brand' do
    list do
      field :title
      field :description
      field :image
      field :sub_categories
    end
  end

    config.model 'Document' do
    list do
      field :title
      field :description
      field :file
    end
  end

  config.model 'Order' do
    list do
      field :name
      field :phone
      field :question
      field :created_at
    end
  end

  config.model 'Product' do
    list do
      field :title
      field :description
      field :image
      field :sub_category
      field :brand
    end
  end

  config.model 'Review' do
    list do
      field :name
      field :photo
      field :body
    end
  end

  config.model 'Service' do
    list do
      field :name
      field :body
    end
  end

    config.model 'SubCategory' do
    list do
      field :title
      field :top_category
      field :brands
    end
  end

  config.model 'TopCategory' do
    list do
      field :title
      field :image
      field :sub_categories
    end
  end

end
