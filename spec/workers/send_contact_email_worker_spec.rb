require 'rails_helper'

RSpec.describe SendContactEmailWorker do
  subject { SendContactEmailWorker.new }

  describe '#perform' do
    it 'sends the email' do
      contact = mock()
      contact
        .expects(:mark_as_processed!)
        .once
        .returns(true)

      Contact.expects(:find)
        .with(1)
        .once
        .returns(contact)

      contact_email = mock()
      contact_email
        .expects(:deliver)
        .once
        .returns(stub())

      ContactMailer.expects(:contact_email)
        .with(contact)
        .once
        .returns(contact_email)

      subject.perform(1)
    end
  end
end
