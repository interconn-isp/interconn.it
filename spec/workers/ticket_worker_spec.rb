RSpec.describe TicketWorker do
  subject { described_class.new }

  describe '#perform' do
    it 'creates the ticket' do
      ticket = stub(
        id:        1,
        full_name: 'John Doe',
        email:     'jdoe@example.com',
        phone:     '3918192716',
        subject:   'Test ticket',
        message:   'Hello, world!',
        category:  stub(value: 1)
      )

      ticket.expects(:destroy!).once.returns(true)

      Ticket.expects(:find).with(1).once.returns(ticket)

      Freshdesk.any_instance.expects(:create_ticket).once.returns(
        'helpdesk_ticket' => {
          'id' => 1,
          'requester_id' => 1
        }
      )

      subject.perform(1)
    end
  end
end
