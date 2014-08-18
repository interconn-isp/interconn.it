require 'rails_helper'

RSpec.describe Inquiry, :type => :model do
  subject { FactoryGirl.build_stubbed(:inquiry) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w(address status).each do |attribute|
    it "validates the presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end

  it 'validates the presence of email if telephone is blank' do
    expect(FactoryGirl.build_stubbed(:inquiry,
      telephone: nil
    )).to validate_presence_of(:email)
  end

  it 'validates the presence of telephone if email is blank' do
    expect(FactoryGirl.build_stubbed(:inquiry,
      email: nil
    )).to validate_presence_of(:telephone)
  end

  describe '#telephone_or_email=' do
    context 'when the value is an email' do
      it 'sets the email attribute' do
        expect {
          subject.telephone_or_email = 'foo@bar'
        }.to change(subject, :telephone_or_email).to('foo@bar')
      end
    end

    context 'when the value is a phone number' do
      it 'sets the telephone attribute' do
        expect {
          subject.telephone_or_email = '0650948193'
        }.to change(subject, :telephone_or_email).to('0650948193')
      end
    end
  end
end
