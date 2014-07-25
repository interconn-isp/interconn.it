require 'rails_helper'

RSpec.describe ContactsWorker do
  subject { ContactsWorker.new }

  before(:each) do
    contact = mock()
    contact
      .expects(:mark_as_processed!)
      .once
      .returns(true)

    Contact
      .expects(:unprocessed)
      .returns([contact])

    email = mock()
    email
      .expects(:deliver)
      .once
      .returns(true)

    ContactMailer
      .expects(:contact_email)
      .with(contact)
      .once
      .returns(email)
  end

  it 'processes the unprocessed contacts' do
    subject.perform
  end
end
