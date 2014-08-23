require 'rails_helper'

RSpec.describe 'the inquiry update page', type: :feature do
  let(:inquiry) { FactoryGirl.create(:inquiry) }
  before(:each) { page.set_rack_session(inquiry_id: inquiry.id) }

  it 'updates the inquiry' do
    visit edit_inquiry_path

    fill_in I18n.t('simple_form.labels.inquiry.notes'), with: 'Foobar'

    expect {
      click_button 'Aggiorna richiesta'
      inquiry.reload
    }.to change(inquiry, :notes).to('Foobar')
  end
end
