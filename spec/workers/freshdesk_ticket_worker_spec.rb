RSpec.describe FreshdeskTicketWorker do
  subject { FreshdeskTicketWorker.new }

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

      Freshdesk.any_instance.expects(:create_ticket).with(helpdesk_ticket: {
        requester_name: 'John Doe',
        email:          'jdoe@example.com',
        subject:        'Test ticket',
        description:    'Hello, world!',
        group_id:       1
      }).once.returns(
        'helpdesk_ticket' => {
          'id' => 1,
          'requester_id' => 1
        }
      )

      Freshdesk.any_instance.expects(:update_user).with(1, user: {
        phone: '3918192716'
      }).once

      subject.perform(1)
    end
  end
end
