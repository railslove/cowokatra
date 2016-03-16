require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create :user }
  let(:product) { create :product }

  context 'POST #create' do
    let(:params) do
      {
        order: {
          user_id: user.id,
          product_id: product.id
        }
      }
    end

    it { expect { post :create, params }.to change { Order.count }.by(1) }
    it { expect(post(:create, params)).to redirect_to user_path(id: user.id) }
  end
end
