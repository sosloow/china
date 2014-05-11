class ReviewTranslation < ActiveRecord::Base
  belongs_to :review

  def locale_enum
    I18n.available_locales
  end
end
