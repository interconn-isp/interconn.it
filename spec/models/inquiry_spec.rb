require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  subject { FactoryGirl.build_stubbed(:inquiry) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w(full_name email).each do |attribute|
    it "validates the presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end

  it 'validates the format of email' do
    expect(subject).not_to allow_value('test').for(:email)
  end

  it 'validates the format of phone' do
    expect(subject).not_to allow_value('test').for(:phone)
  end

  describe '.stale' do
    let!(:stale_inquiry) do
      inquiry = FactoryGirl.create(:inquiry)
      inquiry.update_column :created_at, Date.yesterday
      inquiry
    end

    let!(:fresh_inquiry) { FactoryGirl.create(:inquiry) }

    it 'returns only the stale inquiries' do
      expect(Inquiry.stale).to eq([stale_inquiry])
    end
  end
end
