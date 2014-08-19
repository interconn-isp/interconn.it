require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject { FactoryGirl.build_stubbed(:ticket) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w(full_name email message).each do |attribute|
    it "validates the presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end

  it 'validates the format of email' do
    expect(subject).not_to allow_value('test').for(:email)
  end

  describe '#mark_as_processed!' do
    it 'sets processed to true' do
      ticket = FactoryGirl.build_stubbed(:ticket)

      ticket
        .expects(:update_column)
        .once
        .with(:processed, true)
        .returns(true)

      ticket.mark_as_processed!
    end
  end
end
