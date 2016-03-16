class User < ActiveRecord::Base
  has_many :orders
  has_many :remaining_orders, -> { where deducted: false }, class_name: 'Order'
  has_many :deducted_orders, -> { where deducted: true }, class_name: 'Order'
end
