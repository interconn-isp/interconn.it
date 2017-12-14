# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The FAQs' do
  it 'Viewing a category' do
    visit root_path
    first(:link, 'Domande frequenti').click

    expect(page).to have_content 'Il costo di installazione comprende'
  end
end
