# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  price      :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should belong_to :product }

  it 'should touch user after update' do
    user = create :user
    user_last_updated = user.updated_at

    create :order, user: user

    expect(user.updated_at).to be > user_last_updated
  end
end
