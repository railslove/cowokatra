require 'rails_helper'

RSpec.feature 'order something', type: :feature do
  before do
    Timecop.freeze '2016-03-06'

    @user = create :user, first_name: 'Darkwing', last_name: 'Duck'
    product = create :product, price: 2.00
    @user.orders.create product: product
  end

  after do
    Timecop.return
  end

  scenario 'see reporting for last two month' do
    visit '/reporting'

    expect(page).to have_text 'Februar 2016'
    expect(page).to have_text 'März 2016'

    expect(find(".user-budget[data-rel='#{@user.id}-02-2016']")).to have_text '–'

    expect(find(".user-budget[data-rel='#{@user.id}-03-2016']")).to have_text '-2,00 €'
  end

  scenario 'pay outstanding orders via reporting' do
    visit '/reporting'

    expect(@user.payments.sum(:amount)).to eq 0

    within "[data-rel=\"#{@user.id}-03-2016\"]" do
      find('a').click
    end

    expect(@user.payments.sum(:amount)).to eq 2.0
  end
end
