class LandingController < ApplicationController
  def index
    @question_categories = QuestionCategory.all
    @top_cats = TopCategory.all
    @reviews = Review.all
    @order = Order.new
  end

  def services
    @services = Service.all
    @order = Order.new
  end
end
