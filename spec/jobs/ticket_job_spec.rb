# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketJob do
  subject { described_class.new }

  describe '#perform' do
    it 'creates the ticket' do
      ticket = FactoryBot.build_stubbed(:ticket)

      ticket
        .expects(:update_column)
        .once

      Ticket
        .expects(:find)
        .with(1)
        .once
        .returns(ticket)

      email = stub
      email
        .expects(:deliver_now)
        .once

      TicketMailer
        .expects(:ticket_email)
        .with(ticket)
        .once
        .returns(email)

      subject.perform(1)
    end
  end
end
