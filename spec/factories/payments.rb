# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  amount     :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  booked_at  :datetime
#

FactoryGirl.define do
  factory :payment do
    user
    amount 12.34
  end
end
