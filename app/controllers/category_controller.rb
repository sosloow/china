class CategoryController < ApplicationController
  def show
    @cat = SubCategory.friendly.find(params['title'])
  end
end
