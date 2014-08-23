require 'rails_helper'

RSpec.describe FreshdeskInquiryCreationWorker do
  subject { FreshdeskInquiryCreationWorker.new }

  describe '#perform' do
    it 'creates the tickets on Freshdesk' do
      inquiry = stub(
        id: 1,
        full_name: 'John Doe',
        email: 'jdoe@example.com'
      )

      Inquiry
        .expects(:find)
        .with(1)
        .once
        .returns(inquiry)

      Freshdesk
        .any_instance
        .expects(:create_ticket)
        .once
        .returns('helpdesk_ticket' => {
          'id' => 1,
          'requester_id' => 1
        })

      inquiry
        .expects(:update_column)
        .with(:freshdesk_ticket_id, 1)
        .once
        .returns(true)

      subject.perform(1)
    end
  end
end
