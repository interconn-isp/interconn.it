require 'rails_helper'

RSpec.describe 'the contact page', type: :feature do
  it 'sends an email' do
    visit contact_path

    contact = FactoryGirl.build(:contact)

    %w(full_name email message).each do |attribute|
      fill_in I18n.t("simple_form.labels.contact.#{attribute}"), with: contact.send(attribute)
    end

    expect {
      click_button 'Contattaci'
    }.to change(Contact, :count).by(1)
  end
end
