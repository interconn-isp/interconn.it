# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Iubenda::Client do
  subject { described_class }

  describe '.get_policy' do
    let(:uri) { 'www.iubenda.com/api/privacy-policy/1' }

    context 'when it is successful' do
      before do
        stub_request(:get, uri)
          .to_return(body: JSON.generate(
            success: true,
            content: 'Test policy'
          ))
      end

      it 'returns the policy from the API' do
        expect(subject.get_policy(1)).to eq('Test policy')
      end
    end

    context 'when it returns an error' do
      before do
        stub_request(:get, uri)
          .to_return(body: JSON.generate(
            success: false,
            error: 'Test error'
          ))
      end

      it 'raises a ResponseError' do
        expect do
          subject.get_policy(1)
        end.to raise_error(Iubenda::Client::ResponseError, 'Test error')
      end
    end
  end
end
