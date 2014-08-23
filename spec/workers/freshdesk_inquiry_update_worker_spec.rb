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
        notes: 'Lorem ipsum dolor sit amet'
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

      inquiry
        .expects(:destroy!)
        .once

      subject.perform(1)
    end
  end
end
