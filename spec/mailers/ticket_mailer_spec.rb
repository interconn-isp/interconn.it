# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketMailer do
  let(:ticket) { FactoryBot.build_stubbed(:ticket) }

  before { ENV['TICKETS_EMAIL'] = 'test@example.com' }

  after { ENV.delete('TICKETS_EMAIL') }

  it 'sends the email' do
    expect do
      described_class.ticket_email(ticket).deliver_now
    end.to change(ActionMailer::Base.deliveries, :size).by(1)
  end
end
