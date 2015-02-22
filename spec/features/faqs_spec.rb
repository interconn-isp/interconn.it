require 'rails_helper'

RSpec.feature 'The FAQs' do
  scenario 'Viewing a category' do
    visit root_path
    click_link 'Domande frequenti'

    expect(page).to have_content 'Il costo di installazione comprende'
  end
end
