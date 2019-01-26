# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/coverage' do
  describe 'GET /' do
    subject { -> { get api_coverage_path } }

    it 'responds with 200 OK' do
      subject.call
      expect(response.status).to eq(200)
    end
  end
end
