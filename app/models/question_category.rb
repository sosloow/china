class QuestionCategory < ActiveRecord::Base
  translates :title do
    validates :title, presence: true
  end

  has_many :questions
  has_many :question_category_translations
  accepts_nested_attributes_for :question_category_translations
end

