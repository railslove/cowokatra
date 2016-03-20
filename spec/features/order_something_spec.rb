require 'rails_helper'

RSpec.feature 'order something', type: :feature do
  let!(:user) { create :user, first_name: 'CoffeeJunkie' }
  let!(:product) { create :product, name: 'Large Coffee', price: 12.34 }

  scenario 'orders a coffee' do
    visit '/'
    click_link 'CoffeeJunkie'
    expect(page).to have_text 'Hallo CoffeeJunkie'

    click_link 'Large Coffee'

    expect(page).to have_text 'Large Coffee gebucht'
    expect(user.orders.first.product).to eq product
  end
end
