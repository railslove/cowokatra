class UsersController < ApplicationController
  before_filter :load_users, only: :index
  before_filter :load_user, only: %i(edit update destroy show)
  before_filter :new_user, only: %i(new create)

  def pay
    @user.pay pay_params

    redirect_to @user, notice: "#{pay_params} € gebucht."
  end

  def create
    @user.attributes = user_params
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update user_params
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar_url)
  end

  def pay_params
    params.permit(:amount)[:amount]
  end

  def load_users
    users = User.order(updated_at: :desc).paginate page: params[:page]
    @users = UserDecorator.decorate_collection users
  end

  def load_user
    @user = User.find(params[:id]).decorate
  end

  def new_user
    @user = User.new
  end
end
