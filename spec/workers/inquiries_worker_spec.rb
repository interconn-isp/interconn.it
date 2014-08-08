require 'rails_helper'

RSpec.describe InquiriesWorker do
  subject { InquiriesWorker.new }

  describe '#perform' do
    let(:inquiry) { FactoryGirl.build_stubbed(:inquiry) }

    it 'processes the inquiries' do
      inquiry.expects(:mark_as_processed!).once

      Inquiry.expects(:unprocessed).returns([inquiry])

      CreateInquiryTrelloCard.any_instance.expects(:create_inquiry_card)
        .with(inquiry.serializable_hash)
        .once
        .returns(true)

      subject.perform
    end
  end
end
