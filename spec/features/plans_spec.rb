RSpec.feature 'The pricing plans page' do
  scenario 'Viewing the WADSL plans' do
    visit root_path
    first(:link, 'Piani').click

    expect(page).to have_content 'WADSL'
  end

  scenario 'Viewing the WHDSL plans' do
    visit root_path
    first(:link, 'Piani').click

    click_link 'WHDSL'

    expect(page).to have_content 'WHDSL'
  end

  scenario 'Viewing the ADSL plans' do
    visit root_path
    first(:link, 'Piani').click

    click_link 'ADSL'

    expect(page).to have_content 'ADSL'
  end

  scenario 'Viewing the optic fiber plans' do
    visit root_path
    first(:link, 'Piani').click

    click_link 'Fibra'

    expect(page).to have_content 'Fibra'
  end

  scenario 'Viewing the VoIP plan' do
    visit root_path
    first(:link, 'Piani').click
    click_link 'VoIP'

    expect(page).to have_content 'telefona via internet'
  end
end
