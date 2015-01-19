require 'rails_helper'

RSpec.describe 'The static page' do
  %w(
    coverage contract careers about press_kit projects contact plans
    plans_wadsl plans_whdsl plans_voip faq faq_terms faq_tech faq_voip
    faq_condos suspended
  ).each do |page|
    context "'#{page}'" do
      it 'is rendered' do
        visit send("#{page}_path")
      end
    end
  end
end
