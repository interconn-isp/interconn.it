require 'rails_helper'

RSpec.describe FreshdeskInquiryUpdateWorker do
  subject { FreshdeskInquiryUpdateWorker.new }

  describe '#perform' do
    it 'updates the tickets on Freshdesk' do
      inquiry = stub(
        id: 1,
        full_name: 'John Doe',
        email: 'jdoe@example.com',
        freshdesk_ticket_id: 1,
        address: 'Fake Address',
        product: stub(text: 'Foobar'),
        notes: 'Lorem ipsum dolor sit amet',
        telephone: '3170188171'
      )

      Inquiry
        .expects(:find)
        .with(1)
        .once
        .returns(inquiry)

      Freshdesk
        .any_instance
        .expects(:add_note_to_ticket)
        .once

      Freshdesk
        .any_instance
        .expects(:get_ticket)
        .with(1)
        .once
        .returns('helpdesk_ticket' => { 'requester_id' => 1 })

      Freshdesk
        .any_instance
        .expects(:update_user)
        .with(1, user: { phone: '3170188171' })
        .once

      inquiry
        .expects(:destroy!)
        .once

      subject.perform(1)
    end
  end
end
