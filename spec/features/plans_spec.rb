RSpec.feature 'The pricing plans page' do
  scenario 'Viewing the plans' do
    visit root_path
    first(:link, 'Piani').click

    expect(page).to have_content 'WADSL'
  end

  scenario 'Viewing the VoIP plan' do
    visit root_path
    first(:link, 'Piani').click
    click_link 'VoIP'

    expect(page).to have_content 'telefona via internet'
  end
end
