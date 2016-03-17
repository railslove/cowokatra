class OrdersController < ApplicationController
  def create
    @order = Order.new order_params
    if @order.save!
      redirect_to user_path(id: order_params[:user_id]), notice: "#{@order.product.name} gebucht"
    else
      redirect_to user_path(id: order_params[:user_id]), alert: '¡ NIETE !'
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id)
  end
end
