# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The static page' do
  %w[coverage contract about contact].each do |page|
    context "'#{page}'" do
      it 'is rendered' do
        visit send("#{page}_path")
      end
    end
  end
end
