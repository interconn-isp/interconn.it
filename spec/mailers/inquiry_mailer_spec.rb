require 'rails_helper'

RSpec.describe InquiryMailer do
  let(:inquiry) { FactoryGirl.build_stubbed(:inquiry) }

  it 'sends the email' do
    expect {
      InquiryMailer.inquiry_email(inquiry).deliver
    }.to change(ActionMailer::Base.deliveries, :size).by(1)
  end
end
