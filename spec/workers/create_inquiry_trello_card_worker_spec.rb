require 'rails_helper'

RSpec.describe CreateInquiryTrelloCardWorker do
  subject { CreateInquiryTrelloCardWorker.new }

  describe '#perform' do
    let(:inquiry) { FactoryGirl.build_stubbed(:inquiry) }

    it 'creates the Trello card' do
      Inquiry.expects(:find).with(1).once.returns(inquiry)

      inquiry.expects(:mark_as_processed!)
        .once
        .with('FakeCardID')
        .returns(true)

      InquiryTrelloManager.any_instance.expects(:create_inquiry_card)
        .once
        .with(inquiry.serializable_hash)
        .returns(stub(id: 'FakeCardID'))

      subject.perform(1)
    end
  end
end
