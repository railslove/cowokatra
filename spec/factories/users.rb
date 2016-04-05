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
#  avatar_url :string
#

FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |i| "First Name #{i}" }
    sequence(:last_name) { |i| "Last Name #{i}" }
    sequence(:email) { |i| "my-email-#{i}@example.org" }
  end
end
