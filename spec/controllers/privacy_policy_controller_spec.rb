require 'rails_helper'

RSpec.describe PrivacyPolicyController do
  describe "GET 'show'" do
    it 'assigns the policy' do
      Iubenda::Client
        .expects(:get_policy)
        .once
        .returns('Foobar')

      get :show
      expect(assigns(:policy)).to eq('Foobar')
    end
  end
end
