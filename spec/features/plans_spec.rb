# frozen_string_literal: true

RSpec.describe 'The pricing plans page' do
  it 'Viewing the WADSL plans' do
    visit root_path
    first(:link, 'Piani').click

    expect(page).to have_content 'WADSL'
  end

  it 'Viewing the ADSL plans' do
    visit root_path
    first(:link, 'Piani').click

    click_link 'ADSL'

    expect(page).to have_content 'ADSL'
  end

  it 'Viewing the optic fiber plans' do
    visit root_path
    first(:link, 'Piani').click

    click_link 'Fibra'

    expect(page).to have_content 'Fibra'
  end

  it 'Viewing the VoIP plan' do
    visit root_path
    first(:link, 'Piani').click
    click_link 'VoIP'

    expect(page).to have_content 'telefona via internet'
  end
end
