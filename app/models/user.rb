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
#

class User < ActiveRecord::Base
  has_many :orders
  has_many :remaining_orders, -> { where deducted: false }, class_name: 'Order'
  has_many :deducted_orders, -> { where deducted: true }, class_name: 'Order'
end
