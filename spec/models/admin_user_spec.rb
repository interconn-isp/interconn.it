require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  subject { FactoryGirl.build_stubbed(:admin_user) }

  it 'is valid' do
    expect(subject).to be_valid
  end
end
