class PaymentsController < ApplicationController
  def create
    @payment = Payment.new payment_params
    if @payment.save!
      respond_to do |format|
        format.html do
          message = "#{view_context.number_to_currency @payment.amount} eingezahlt"
          redirect_to user_path(id: payment_params[:user_id]), notice: message
        end

        format.js { render :create }
      end
    else
      respond_to do |format|
        format.js { render :create }
        format.html { redirect_to user_path(id: payment_params[:user_id]), alert: '¡ NIETE !' }
      end
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :amount, :booked_at)
  end
end
