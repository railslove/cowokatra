class OrdersController < ApplicationController
  def create
    @order = Order.new order_params
    if @order.save!
      redirect_to user_path(id: order_params[:user_id]), notice: 'OM NOM NOM'
    else
      redirect_to user_path(id: order_params[:user_id]), alert: 'BOOM! Do it again!'
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id)
  end
end
