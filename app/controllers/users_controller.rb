class UsersController < ApplicationController
  before_filter :load_resource

  def pay
    @user.pay pay_params

    redirect_to @user, notice: "#{pay_params} € gebucht."
  end

  private

  def pay_params
    params.permit(:amount)[:amount]
  end

  def load_resource
    if action_name.in? %w(index)
      users = User.order(updated_at: :desc).paginate page: params[:page]
      @users = UserDecorator.decorate_collection users
    else
      @user = User.find(params[:id]).decorate
    end
  end
end
