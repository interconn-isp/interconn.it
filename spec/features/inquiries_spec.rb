require 'rails_helper'

RSpec.describe 'the inquiry creation page', type: :feature do
  it 'creates an inquiry' do
    visit new_inquiry_path

    inquiry = FactoryGirl.attributes_for(:inquiry)

    %w(full_name email phone address).each do |attribute|
      fill_in I18n.t("simple_form.labels.inquiry.#{attribute}"), with: inquiry[attribute.to_sym]
    end

    expect {
      click_button 'Richiedi il tuo sopralluogo'
    }.to change(Inquiry, :count).by(1)
  end
end