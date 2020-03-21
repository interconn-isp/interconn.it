# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the inquiry creation page', type: :feature do
  before { ENV['INQUIRIES_EMAIL'] = 'help@interconn.it' }

  after { ENV.delete('INQUIRIES_EMAIL') }

  it 'creates an inquiry' do
    visit new_inquiry_path

    inquiry = FactoryBot.attributes_for(:inquiry)

    %w[full_name email phone address].each do |attribute|
      fill_in I18n.t("simple_form.labels.inquiry.#{attribute}"), with: inquiry[attribute.to_sym]
    end

    select Plan.find_by(slug: inquiry[:product]).full_name,
           from: I18n.t('simple_form.labels.inquiry.product')

    expect do
      click_button 'Richiedi il tuo sopralluogo'
    end.to change(Inquiry, :count).by(1)
  end
end
