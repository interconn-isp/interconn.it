require 'rails_helper'

RSpec.describe 'The static page' do
  %w(coverage contract careers about press_kit projects contact pricing pricing_wadsl pricing_whdsl pricing_voip faq faq_terms faq_tech faq_voip faq_condos).each do |page|
    context "'#{page}'" do
      it 'is rendered' do
        visit send("#{page}_path")
      end
    end
  end
end
