class CategoryController < ApplicationController
  def show
    @cat = SubCategory.find(params['id'])
  end
end
