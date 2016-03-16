# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  slug       :string
#  name       :string
#  price      :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders
end
