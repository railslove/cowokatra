class CardsController < ApplicationController
  def show
    card = Card.find_by! card_id: params[:id]
    redirect_to card.user
  rescue ActiveRecord::RecordNotFound
    redirect_to new_card_path(card_id: params[:id])
  end

  def new
    @card = Card.new card_id: params[:card_id]
    users = User.order(updated_at: :desc).paginate page: params[:page]
    @users = UserDecorator.decorate_collection users
  end

  def create
    card = Card.new card_params
    if card.save
      redirect_to card.user
    else
      render :new
    end
  end

  private

  def card_params
    params.require(:card).permit(:user_id, :card_id)
  end
end
