RailsAdmin.config do |config|
  require 'i18n'
  I18n.default_locale = :ru

  config.included_models = ['Brand', 'Product', 'TopCategory', 'SubCategory',
                            'Question', 'QuestionCategory', 'User', 'Document']
end
