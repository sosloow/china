class LandingController < ApplicationController
  def index
    @question_categories = QuestionCategory.all

    @prod_cats = ProductsCategory.where(parent_id: nil)
  end
end
