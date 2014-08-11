require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe "GET 'new'" do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    context 'with valid params' do
      let(:params) { FactoryGirl.attributes_for(:contact) }

      it 'is successful' do
        expect {
          post :create, contact: params
        }.to change(Contact, :count).by(1)
      end

      it 'delivers the email asynchronously' do
        expect {
          post :create, contact: params
        }.to change(SendContactEmailWorker.jobs, :size).by(1)
      end
    end

    context 'with invalid params' do
      let(:params) { { email: 'test' } }

      it 'is not successful' do
        expect {
          post :create, contact: params
        }.not_to change(Contact, :count)
      end
    end
  end
end
