class LandingController < ApplicationController
  def index
    @question_categories = QuestionCategory.all

    @top_cats = TopCategory.all
  end
end
