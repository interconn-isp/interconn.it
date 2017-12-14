# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  subject { FactoryBot.build_stubbed(:inquiry) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w[full_name email product].each do |attribute|
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
end
