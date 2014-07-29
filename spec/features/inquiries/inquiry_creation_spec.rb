require 'rails_helper'

RSpec.describe 'the inquiry creation page', type: :feature do
  it 'creates an inquiry' do
    visit root_path

    inquiry = FactoryGirl.attributes_for(:inquiry)

    fill_in 'Il tuo indirizzo', with: inquiry[:address]
    fill_in 'Telefono o email', with: inquiry[:email]

    expect {
      click_button 'Inizia la prova!'
    }.to change(Inquiry, :count).by(1)
  end
end
