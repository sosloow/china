class PageTranslation < ActiveRecord::Base
  belongs_to :page

  def locale_enum
    I18n.available_locales
  end
end
