# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The privacy policy' do
  it 'Displaying the policy' do
    Iubenda::Client
      .expects(:get_policy)
      .once
      .returns('Test privacy policy')

    visit privacy_policy_path
    expect(page).to have_content 'Test privacy policy'
  end
end
