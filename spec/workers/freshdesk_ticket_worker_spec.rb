RSpec.describe FreshdeskTicketWorker do
  subject { FreshdeskTicketWorker.new }

  describe '#perform' do
    it 'creates the ticket' do
      ticket = stub(
        id:        1,
        full_name: 'John Doe',
        email:     'jdoe@example.com',
        phone:     '3918192716',
        message:   'Hello, world!'
      )

      ticket.expects(:mark_as_processed!).once.returns(true)

      Ticket.expects(:find).with(1).once.returns(ticket)

      Freshdesk.any_instance.expects(:create_ticket).with(helpdesk_ticket: {
        requester_name: 'John Doe',
        email:          'jdoe@example.com',
        subject:        'Richiesta di supporto',
        description:    'Hello, world!'
      }).once.returns(stub())

      subject.perform(1)
    end
  end
end
