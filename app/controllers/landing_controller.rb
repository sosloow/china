class LandingController < ApplicationController
  def index
    @question_categories = QuestionCategory.all
    @top_cats = TopCategory.all
    @reviews = Review.all
  end

  def services
    @services = Service.all
  end
end
