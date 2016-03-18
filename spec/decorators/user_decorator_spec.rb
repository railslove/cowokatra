require 'spec_helper'

describe UserDecorator do
  let(:user) { create(:user).decorate }

  it { expect(user.name).to eq "#{user.first_name} #{user.last_name}" }
  it 'should calculate the budget correctly' do
    create_list :payment, 7, user: user, amount: 2.47
    create_list :order, 5, user: user, price: 12.34

    expect(user.calculated_budget).to eq(-44.41)
  end
end
