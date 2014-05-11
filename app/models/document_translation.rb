class DocumentTranslation < ActiveRecord::Base
  belongs_to :document

  def locale_enum
    I18n.available_locales
  end
end
