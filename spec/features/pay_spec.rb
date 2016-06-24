require 'rails_helper'

RSpec.feature 'order something', type: :feature do
  let!(:user) { create :user, first_name: 'Richie', last_name: 'Rich' }

  scenario 'adds a payment' do
    visit '/'
    find("a[rel=\"#{user.id}\"]").click
    expect(page).to have_text 'Hallo Richie'

    click_link '5,00 €'

    expect(page).to have_text '5,00 € eingezahlt'
    expect(user.payments.sum(:amount)).to eq 5.00
  end
end
