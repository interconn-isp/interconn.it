require 'rails_helper'

RSpec.describe FAQCategory, type: :model do
  subject { FactoryGirl.build(:faq_category) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w(name).each do |attribute|
    it "validates the presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end

  %w(name slug).each do |attribute|
    it "validates the uniqueness of #{attribute}" do
      FactoryGirl.create :faq_category
      expect(subject).to validate_uniqueness_of(attribute)
    end
  end
end
