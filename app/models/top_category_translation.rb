class TopCategoryTranslation < ActiveRecord::Base
  belongs_to :top_category

  def locale_enum
    I18n.available_locales
  end
end
