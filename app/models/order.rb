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

  def self.weekly(week = Date.today.cweek, year = Date.today.year)
    select_qry = "#{table_name}.user_id,
                  COUNT(#{table_name}.price) AS amount"
    beginning_of_week = Date.commercial(year, week, 1)
    end_of_week = Date.commercial(year, week, 7)

    includes(:user).select(select_qry).where(created_at: beginning_of_week..end_of_week)
                   .group(:week, :user_id).order(user_id: :desc)
  end

  def self.weekly_by_user(user_id, week = Date.today.cweek, year = Date.today.year)
    weekly(week, year).find_by(user_id: user_id)
  end

  private

  def pull_price
    self.price = product.price
  end

  def touch_user
    user.touch
  end
end
