class BrandController < ApplicationController
  def show
    @brand = Brand.friendly.find(params[:title])
    @order = Order.new
  end
end
