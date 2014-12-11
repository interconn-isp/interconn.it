require 'rails_helper'

RSpec.feature 'The privacy policy' do
  scenario 'Displaying the policy' do
    Iubenda::Client
      .expects(:get_policy)
      .once
      .returns('Test privacy policy')

    visit privacy_policy_path
    expect(page).to have_content 'Test privacy policy'
  end
end
