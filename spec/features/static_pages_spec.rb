require 'rails_helper'

RSpec.describe 'The static page' do
  %w(coverage contract about press_kit projects contact).each do |page|
    context "'#{page}'" do
      it 'is rendered' do
        visit send("#{page}_path")
      end
    end
  end
end
