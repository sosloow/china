class ProductTranslation < ActiveRecord::Base
  belongs_to :product

  def locale_enum
    I18n.available_locales
  end
end
