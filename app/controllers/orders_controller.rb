class OrdersController < ApplicationController
  def create
    @order = Order.new order_params

    respond_to do |format|
      format.html do
        result = @order.save ? { notice: "#{@order.product.name} gebucht"} : { alert: '¡ NIETE !' }
        redirect_to user_path(id: order_params[:user_id]), result
      end

      format.json { render json: { success: @order.save } }
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id)
  end
end
