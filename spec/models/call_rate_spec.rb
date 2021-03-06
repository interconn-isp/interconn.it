# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CallRate, type: :model do
  subject { FactoryBot.build(:call_rate) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  %w[traffic_direction rate time_slot].each do |attribute|
    it "validates presence of #{attribute}" do
      expect(subject).to validate_presence_of(attribute)
    end
  end

  it 'validates numericality of rate' do
    expect(subject).to validate_numericality_of(:rate).is_greater_than_or_equal_to(0)
  end
end
