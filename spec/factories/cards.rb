# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  user_id    :string
#  card_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :card do
    user_id "MyString"
    card_id "MyString"
  end
end
