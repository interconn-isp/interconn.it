# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the call rate consultation page', type: :feature do
  it 'displays the search modal', js: true do
    visit plan_category_path(PlanCategory.find_by_slug('voip'))
    click_link 'questo modulo.'

    expect(page).to have_content('Tariffe VoIP')
  end

  it 'displays the matching call rates', js: true do # rubocop:disable RSpec/MultipleExpectations
    visit plan_category_path(PlanCategory.find_by_slug('voip'))
    click_link 'questo modulo.'

    FactoryBot.create(:call_rate,
      traffic_direction: 'Foobar',
      rate: 0.0266,
      time_slot: :flat,
    )

    fill_in 'Dove vuoi chiamare?', with: 'bar'
    click_button 'Cerca'

    sleep 0.1
    expect(page).not_to have_css('#call-rates-loading')

    within '#call-rates-table' do
      expect(page).to have_content 'Foobar'
      expect(page).to have_content '€0,027/min'
    end
  end
end
