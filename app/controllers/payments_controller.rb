class PaymentsController < ApplicationController
  def create
    @payment = Payment.new payment_params
    if @payment.save!
      message = "#{view_context.number_to_currency @payment.amount} eingezahlt"
      redirect_to user_path(id: payment_params[:user_id]), notice: message
    else
      redirect_to user_path(id: payment_params[:user_id]), alert: '¡ NIETE !'
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :amount)
  end
end
