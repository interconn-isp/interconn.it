require 'rails_helper'

RSpec.describe InquiriesController, type: :controller do
  describe "GET 'new'" do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    before(:each) { ENV['INQUIRIES_EMAIL'] = 'help@interconn.it' }
    after(:each) { ENV.delete('INQUIRIES_EMAIL') }

    context 'with valid params' do
      let(:params) { FactoryGirl.attributes_for(:inquiry) }

      it 'creates the inquiry' do
        expect {
          post :create, inquiry: params
        }.to change(Inquiry, :count).by(1)
      end

      it 'asynchronously creates the Freshdesk ticket' do
        InquiryJob.expects(:perform_later).once
        post :create, inquiry: params
      end
    end

    context 'with invalid params' do
      let(:params) { { telephone_or_email: '' } }

      it 'does not create the inquiry' do
        expect {
          post :create, inquiry: params
        }.not_to change(Inquiry, :count)
      end
    end
  end
end
