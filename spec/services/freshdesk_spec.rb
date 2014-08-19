require 'rails_helper'

RSpec.describe Freshdesk do
  subject do
    Freshdesk.new(
      freshdesk_domain: 'test.freshdesk.com',
      freshdesk_api_key: 'fake'
    )
  end

  before(:each) { VCR.insert_cassette('freshdesk') }
  after(:each) { VCR.eject_cassette }

  describe '#create_ticket' do
    it 'creates the ticket' do
      expect {
        subject.create_ticket(helpdesk_ticket: {
          description: 'Some details on the issue ...',
          subject: 'Support needed..',
          email: 'tom@outerspace.com'
        })
      }.not_to raise_error
    end
  end

  describe '#update_user' do
    it 'updates the user' do
      expect {
        subject.update_user(5000219246, user: { name: 'John Doe' })
      }.not_to raise_error
    end
  end
end
