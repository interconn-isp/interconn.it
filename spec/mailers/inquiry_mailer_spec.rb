require 'rails_helper'

RSpec.describe InquiryMailer do
  before(:each) { ENV['INQUIRIES_EMAIL'] = 'help@interconn.it' }
  after(:each) { ENV.delete('INQUIRIES_EMAIL') }

  let(:inquiry) do
    inquiry = FactoryGirl.build_stubbed(:inquiry,
      notes: 'Lorem ipsum',
      referer: 'John Doe'
    )

    inquiry.stubs(
      product: 'foo',
      product_value: 'foo'
    )

    inquiry
  end

  it 'sends the email' do
    Plan
      .expects(:find_by_slug)
      .once
      .with('foo')
      .returns(Plan.new)

    expect {
      InquiryMailer.inquiry_email(inquiry).deliver_now
    }.to change(ActionMailer::Base.deliveries, :size).by(1)
  end
end
