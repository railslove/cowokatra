require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:orders) }
  it { should have_many(:deducted_orders) }
  it { should have_many(:remaining_orders) }
end
