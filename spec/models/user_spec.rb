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

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:orders) }
  it { should have_many(:cards) }
  it { should have_many(:payments) }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :email }
end
