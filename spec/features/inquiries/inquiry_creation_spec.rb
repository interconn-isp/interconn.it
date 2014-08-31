require 'rails_helper'

RSpec.describe 'the inquiry creation page', type: :feature do
  it 'creates an inquiry' do
    visit root_path

    inquiry = FactoryGirl.attributes_for(:inquiry)

    fill_in 'Nome e cognome', with: inquiry[:full_name]
    fill_in 'Indirizzo email', with: inquiry[:email]

    expect {
      click_button 'Inizia la tua prova!'
    }.to change(Inquiry, :count).by(1)
  end
end
