class QuestionCategoryTranslation < ActiveRecord::Base
  belongs_to :question_category

  def locale_enum
    I18n.available_locales
  end
end
