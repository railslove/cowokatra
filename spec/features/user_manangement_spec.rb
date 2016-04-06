require 'rails_helper'

RSpec.feature 'order something', type: :feature do
  let!(:user) { create :user, first_name: 'Darkwing', last_name: 'Duck' }

  scenario 'create a user' do
    visit '/'
    click_link 'Neuer Benutzer'

    within 'form#new_user' do
      fill_in 'Vorname', with: 'Donald'
      fill_in 'Nachname', with: 'Duck'
      fill_in 'E-Mail-Adresse', with: 'donald@duck.de'
      expect { click_button 'Speichern' }.to change { User.count }.by(1)
    end
    expect(page).to have_text 'Hallo Donald'
    expect(find('.user-image')).to have_text 'Donald'
  end

  scenario 'update a user' do
    visit '/'
    click_link 'Darkwing'
    expect(page).to have_text 'Hallo Darkwing'
    expect(find('.user-image')).to have_text 'Darkwing'

    click_link 'Bearbeiten'

    within 'form.edit_user' do
      fill_in 'Vorname', with: 'Donald'
      fill_in 'Nachname', with: 'Duck'
      expect { click_button 'Speichern' }.to_not change { User.count }
    end
    expect(page).to have_text 'Hallo Donald'
    expect(find('.user-image')).to have_text 'Donald'
  end
end
