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

class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :user, presence: true
  validates :product, presence: true

  before_create :pull_price
  after_create :touch_user

  private

  def pull_price
    self.price = product.price
  end

  def touch_user
    user.touch
  end
end
