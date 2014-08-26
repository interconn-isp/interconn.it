require 'rails_helper'

RSpec.describe 'the call rate consultation page', type: :feature do
  it 'displays the search modal', js: true do
    visit pricing_voip_path
    click_link 'questo modulo.'

    expect(page).to have_content('Tariffe VoIP')
  end

  it 'displays the matching call rates', js: true do
    visit pricing_voip_path
    click_link 'questo modulo.'

    FactoryGirl.create(:call_rate, {
      traffic_direction: 'Foobar',
      rate: 0.0266,
      time_slot: :flat
    })

    fill_in 'Dove vuoi chiamare?', with: 'bar'
    click_button 'Cerca'

    within '#call-rates-table' do
      expect(page).to have_content 'Foobar'
      expect(page).to have_content '€0,027/min'
    end
  end
end
