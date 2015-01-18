require 'rails_helper'

RSpec.describe InquiryJob do
  subject { described_class.new }

  describe '#perform' do
    it 'creates the tickets on Freshdesk' do
      inquiry = FactoryGirl.build_stubbed(:inquiry)

      inquiry
        .expects(:update_column)
        .once

      Inquiry
        .expects(:find)
        .with(1)
        .once
        .returns(inquiry)

      email = stub()
      email
        .expects(:deliver_now)
        .once

      InquiryMailer
        .expects(:inquiry_email)
        .with(inquiry)
        .once
        .returns(email)

      subject.perform(1)
    end
  end
end
