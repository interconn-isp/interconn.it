require 'rails_helper'

RSpec.describe ContactMailer, :type => :mailer do
  subject { ContactMailer }

  describe '.contact_email' do
    it 'delivers an email' do
      Contact.expects(:find)
        .with(1)
        .once
        .returns(stub(
          full_name: 'John Doe',
          phone: '',
          email: 'jdoe@example.com',
          message: 'Lorem ipsum dolor sit amet',
          source_ip: '127.0.0.1',
          created_at: Time.now
        ))

      expect {
        ContactMailer.contact_email(1).deliver
      }.to change(ActionMailer::Base.deliveries, :size).by(1)
    end
  end
end
