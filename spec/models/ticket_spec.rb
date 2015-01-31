require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject { FactoryGirl.build_stubbed(:ticket) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w(full_name email message subject category).each do |attribute|
    it "validates the presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end

  it 'validates the format of email' do
    expect(subject).not_to allow_value('test').for(:email)
  end

  it 'ensures the length of subject is at least 4' do
    expect(subject).to validate_length_of(:subject).is_at_least(4)
  end

  it 'ensures the length of message is at least 10' do
    expect(subject).to validate_length_of(:message).is_at_least(10)
  end

  it 'validates the format of phone' do
    expect(subject).not_to allow_value('test').for(:phone)
  end
end
