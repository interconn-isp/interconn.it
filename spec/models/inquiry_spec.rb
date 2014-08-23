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
end
