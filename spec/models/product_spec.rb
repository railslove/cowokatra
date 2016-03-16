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
#  order      :integer          default("0")
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many :orders }
  it { should have_many(:users).through(:orders) }

  it 'should init slug' do
    product = create :product, name: 'Hallo Welt'
    expect(product.slug).to eq 'hallo_welt'

    product2 = create :product, name: 'Hallo Welt'
    expect(product2.slug).to eq 'hallo_welt1'
  end
end
