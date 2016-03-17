# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  budget     :decimal(6, 2)    default("0.0")
#

class User < ActiveRecord::Base
  has_many :orders
  has_many :cards

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  def pay(amount)
    update budget: budget + amount.to_f
  end
end
