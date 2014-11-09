RSpec.describe TicketWorker do
  subject { described_class.new }

  describe '#perform' do
    it 'creates the ticket' do
      ticket = FactoryGirl.build_stubbed(:ticket)

      Ticket
        .expects(:find)
        .with(1)
        .once
        .returns(ticket)

      email = stub()
      email
        .expects(:deliver)
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
