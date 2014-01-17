class BrandController < ApplicationController
  def show
    @brand = Brand.friendly.find(params[:title])
  end
end
