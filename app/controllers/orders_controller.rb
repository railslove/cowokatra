class OrdersController < ApplicationController
  before_filter :load_user

  private

  def load_user
    @user = User.find params[:user_id]
  end
end
