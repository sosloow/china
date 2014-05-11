class BrandTranslation < ActiveRecord::Base
  belongs_to :brand

  def locale_enum
    I18n.available_locales
  end
end
