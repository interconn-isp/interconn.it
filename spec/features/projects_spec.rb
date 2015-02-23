require 'rails_helper'

RSpec.feature 'The projects page' do
  scenario 'Displaying the projects' do
    visit root_path
    click_link 'Progetti'

    expect(page).to have_content 'Albatros'
  end
end
