require 'rails_helper'

RSpec.describe CallRatesController, type: :controller do
  describe "GET 'index'" do
    context 'with an invalid query' do
      it 'is not successful' do
        get :index, format: :json
        expect(response).not_to be_successful
      end
    end

    context 'with a valid query' do
      let!(:matching_rate) { FactoryGirl.create(:call_rate, traffic_direction: 'Foobar') }
      let!(:non_matching_rate) { FactoryGirl.create(:call_rate, traffic_direction: 'Baz') }

      it 'assigns the matching rates' do
        get :index, q: 'bar', format: :json
        expect(assigns(:call_rates)).to eq([matching_rate])
      end
    end
  end
end
