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

FactoryGirl.define do
  factory :product do
    sequence(:name) { |i| "Produkt #{i}" }
    price 12.34
  end
end
