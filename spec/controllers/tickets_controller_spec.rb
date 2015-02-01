require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe "GET 'new'" do
    it 'is successful' do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    context 'with valid params' do
      let(:params) { FactoryGirl.attributes_for(:ticket) }

      before(:each) { ENV['TICKETS_EMAIL'] = 'test@example.com' }
      after(:each) { ENV.delete('TICKETS_EMAIL') }

      it 'is successful' do
        expect {
          post :create, ticket: params
        }.to change(Ticket, :count).by(1)
      end

      it 'creates the ticket on Freshdesk asynchronously' do
        TicketJob.expects(:perform_later).once
        post :create, ticket: params
      end
    end

    context 'with invalid params' do
      let(:params) { { email: 'test' } }

      it 'is not successful' do
        expect {
          post :create, ticket: params
        }.not_to change(Ticket, :count)
      end
    end
  end
end
