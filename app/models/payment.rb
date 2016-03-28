# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Payment < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :amount, presence: true

  def self.weekly(week = Date.today.cweek, year = Date.today.year)
    select_qry = "#{table_name}.user_id,
                  COUNT(#{table_name}.amount) AS amount"
    beginning_of_week = Date.commercial(year, week, 1)
    end_of_week = Date.commercial(year, week, 7)

    select(select_qry).where(created_at: beginning_of_week..end_of_week)
                      .group(:week, :user_id).order(user_id: :desc)
  end

  def self.weekly_by_user(user_id, week = Date.today.cweek, year = Date.today.year)
    weekly(week, year).find_by(user_id: user_id)
  end
end
