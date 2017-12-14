# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the contact page', type: :feature do
  before { ENV['TICKETS_EMAIL'] = 'test@example.com' }
  after { ENV.delete('TICKETS_EMAIL') }

  it 'sends an email' do
    visit contact_path

    ticket = FactoryBot.build(:ticket)

    %w[full_name email message subject].each do |attribute|
      fill_in I18n.t("simple_form.labels.ticket.#{attribute}"), with: ticket.send(attribute)
    end

    expect do
      click_button 'Contattaci'
    end.to change(Ticket, :count).by(1)
  end
end
