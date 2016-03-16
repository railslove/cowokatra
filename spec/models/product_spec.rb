require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many :orders }
  it { should have_many(:users).through(:orders) }
end
