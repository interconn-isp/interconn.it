require 'rails_helper'

RSpec.describe TicketMailer do
  let(:ticket) { FactoryGirl.build_stubbed(:ticket) }

  it 'sends the email' do
    expect {
      TicketMailer.ticket_email(ticket).deliver
    }.to change(ActionMailer::Base.deliveries, :size).by(1)
  end
end
