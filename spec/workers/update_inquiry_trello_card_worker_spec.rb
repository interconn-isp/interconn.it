require 'rails_helper'

RSpec.describe UpdateInquiryTrelloCardWorker do
  subject { UpdateInquiryTrelloCardWorker.new }

  describe '#perform' do
    let(:inquiry) { FactoryGirl.build_stubbed(:inquiry, trello_card_id: 'FakeCardID') }

    it 'updates the Trello card' do
      Inquiry.expects(:find).with(1).once.returns(inquiry)

      InquiryTrelloManager.any_instance.expects(:update_inquiry_card)
        .once
        .with('FakeCardID', inquiry.serializable_hash)

      subject.perform(1)
    end
  end
end
