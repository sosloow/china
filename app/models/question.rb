class Question < ActiveRecord::Base
  belongs_to :question_category

  validates :title, presence: true
  validates :body, presence: true
end
