require 'rails_helper'

RSpec.describe 'the contact page', type: :feature do
  it 'sends an email' do
    visit contact_path

    ticket = FactoryGirl.build(:ticket)

    %w(full_name email message subject).each do |attribute|
      fill_in I18n.t("simple_form.labels.ticket.#{attribute}"), with: ticket.send(attribute)
    end

    select ticket.category.text, from: I18n.t('simple_form.labels.ticket.category')

    expect {
      click_button 'Contattaci'
    }.to change(Ticket, :count).by(1)
  end
end
