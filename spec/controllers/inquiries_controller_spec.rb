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
        }.to change(FreshdeskInquiryCreationWorker.jobs, :size).by(1)
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

  describe "GET 'edit'" do
    context 'with a valid inquiry in session' do
      let(:inquiry) { FactoryGirl.create(:inquiry) }

      it 'is successful' do
        get :edit, {}, { inquiry_id: inquiry.id }
        expect(response).to be_success
      end

      it 'loads the inquiry' do
        get :edit, {}, { inquiry_id: inquiry.id }
        expect(assigns(:inquiry)).to eq(inquiry)
      end
    end

    context 'with no inquiry in session' do
      it 'is unsuccessful' do
        get :edit
        expect(response).not_to be_success
      end
    end
  end

  describe "PUT 'update'" do
    context 'with a valid inquiry in session' do
      let(:inquiry) { FactoryGirl.create(:inquiry) }

      context 'with valid params' do
        let(:params) { FactoryGirl.attributes_for(:inquiry) }

        it 'is successful' do
          put :update, { inquiry: params }, { inquiry_id: inquiry.id }
          expect(response).to be_success
        end

        it 'updates the inquiry' do
          expect {
            put :update, { inquiry: params }, { inquiry_id: inquiry.id }
            inquiry.reload
          }.to change(inquiry, :email).to(params[:email])
        end
      end

      context 'with invalid params' do
        let(:params) { { email: '' } }

        it 'does not update the inquiry' do
          expect {
            put :update, { inquiry: params }, { inquiry_id: inquiry.id }
            inquiry.reload
          }.not_to change(inquiry, :email)
        end
      end
    end

    context 'with no inquiry in session' do
      it 'is unsuccessful' do
        put :update
        expect(response).not_to be_success
      end
    end
  end
end
