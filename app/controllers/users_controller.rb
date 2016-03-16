class UsersController < ApplicationController
  before_filter :load_resource

  private

  def load_resource
    if action_name.in? %w(index)
      users = User.order(updated_at: :desc).paginate page: params[:page]
      @users = UserDecorator.decorate_collection users
    else
      @user = User.find(params[:id]).decorate
    end
  end
end
