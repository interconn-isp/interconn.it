require 'rails_helper'

RSpec.describe FAQ, type: :model do
  subject { FactoryGirl.build(:faq) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w(category question answer).each do |attribute|
    it "validates the presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end
end
