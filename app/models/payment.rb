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
end
