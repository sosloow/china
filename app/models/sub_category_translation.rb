class SubCategoryTranslation < ActiveRecord::Base
  belongs_to :sub_category

  def locale_enum
    I18n.available_locales
  end
end
