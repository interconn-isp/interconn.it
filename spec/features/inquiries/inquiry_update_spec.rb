require 'rails_helper'

RSpec.describe 'the inquiry update page', type: :feature do
  let(:inquiry) { FactoryGirl.create(:inquiry) }
  before(:each) { page.set_rack_session(inquiry_code: inquiry.code) }

  it 'updates the inquiry' do
    visit edit_inquiry_path

    fill_in I18n.t('simple_form.labels.inquiry.full_name'), with: 'John Doe'

    expect {
      click_button 'Aggiorna richiesta'
      inquiry.reload
    }.to change(inquiry, :full_name).to('John Doe')
  end
end
