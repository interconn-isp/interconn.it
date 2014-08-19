require 'rails_helper'

RSpec.describe Freshdesk do
  subject do
    Freshdesk.new(
      freshdesk_domain: 'test.freshdesk.com',
      freshdesk_api_key: 'fake'
    )
  end

  describe '#create_ticket' do
    it 'creates the ticket' do
      VCR.use_cassette('freshdesk') do
        expect {
          subject.create_ticket(helpdesk_ticket: {
            description: 'Some details on the issue ...',
            subject: 'Support needed..',
            email: 'tom@outerspace.com'
          })
        }.not_to raise_error
      end
    end
  end
end
