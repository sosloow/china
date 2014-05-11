class Question < ActiveRecord::Base
  belongs_to :question_category

  translates :title, :body do
    validates :title, presence: true
    validates :body, presence: true
  end

  has_many :question_translations
  accepts_nested_attributes_for :question_translations
end

