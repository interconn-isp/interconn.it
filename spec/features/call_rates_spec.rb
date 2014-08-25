require 'rails_helper'

RSpec.describe 'the call rate consultation page', type: :feature do
  before(:each) do
    visit pricing_voip_path
    click_link 'questo modulo.'
  end

  it 'displays the search modal', js: true do
    expect(page).to have_content('Tariffe VoIP')
  end

  it 'displays the matching call rates', js: true do
    FactoryGirl.create(:call_rate, {
      traffic_direction: 'Foobar',
      rate: 0.026,
      time_slot: :flat
    })

    fill_in 'Dove vuoi chiamare?', with: 'bar'
    click_button 'Cerca'

    within '#call-rates-table' do
      expect(page).to have_content 'Foobar'
      expect(page).to have_content '€0,03/min'
    end
  end
end
