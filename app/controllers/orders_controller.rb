class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    if @order.save
      OrderMailer.new_order(@order).deliver
      render json: {controller: 'landing', action: 'index', status: :created, location: @order }
    else
      render json: {json: @order.errors, status: :unprocessable_entity }
    end
  end

  def order_params
    params.require(:order).permit(:name, :phone, :question)
  end
end
