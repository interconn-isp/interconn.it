require 'rails_helper'

RSpec.feature 'The projects page' do
  scenario 'Displaying the projects' do
    visit root_path
    first(:link, 'Progetti').click

    expect(page).to have_content 'Albatros'
  end
end
