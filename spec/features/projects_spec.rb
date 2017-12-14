# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The projects page' do
  it 'Displaying the projects' do
    visit root_path
    first(:link, 'Progetti').click

    expect(page).to have_content 'Albatros'
  end
end
