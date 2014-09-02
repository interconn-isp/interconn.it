require 'rails_helper'

RSpec.describe InquiriesController, type: :controller do
  describe "POST 'create'" do
    context 'with valid params' do
      let(:params) { FactoryGirl.attributes_for(:inquiry) }

      it 'creates the inquiry' do
        expect {
          post :create, inquiry: params
        }.to change(Inquiry, :count).by(1)
      end

      it 'asynchronously creates the Freshdesk ticket' do
        expect {
          post :create, inquiry: params
        }.to change(InquiryWorker.jobs, :size).by(1)
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
