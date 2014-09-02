require 'rails_helper'

RSpec.describe InquiryWorker do
  subject { described_class.new }

  describe '#perform' do
    it 'creates the tickets on Freshdesk' do
      inquiry = stub(
        id: 1,
        full_name: 'John Doe',
        email: 'jdoe@example.com',
        product: nil,
        phone: '3281716819',
        address: 'Via Fasulla 123',
        notes: ''
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
          'display_id' => 1,
          'requester_id' => 1
        })

      inquiry
        .expects(:destroy!)
        .once

      subject.perform(1)
    end
  end
end
