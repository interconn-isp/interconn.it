require 'rails_helper'

RSpec.describe TicketMailer do
  let(:ticket) { FactoryGirl.build_stubbed(:ticket) }

  before(:each) { ENV['TICKETS_EMAIL'] = 'test@example.com' }
  after(:each) { ENV.delete('TICKETS_EMAIL') }

  it 'sends the email' do
    expect {
      TicketMailer.ticket_email(ticket).deliver_now
    }.to change(ActionMailer::Base.deliveries, :size).by(1)
  end
end
