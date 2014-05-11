class QuestionTranslation < ActiveRecord::Base
  belongs_to :question

  def locale_enum
    I18n.available_locales
  end
end
