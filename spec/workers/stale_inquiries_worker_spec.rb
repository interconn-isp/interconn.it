require 'rails_helper'

RSpec.describe StaleInquiriesWorker do
  subject { StaleInquiriesWorker.new }

  describe '#perform' do
    it 'destroys the stale inquiries' do
      stale_inquiries = mock()

      stale_inquiries
        .expects(:destroy_all)
        .once

      Inquiry
        .expects(:stale)
        .once
        .returns(stale_inquiries)

      subject.perform
    end
  end
end
