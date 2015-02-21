require 'rails_helper'

RSpec.feature 'The FAQs' do
  scenario 'Viewing a category' do
    category = FactoryGirl.create(:faq_category)
    faq = FactoryGirl.create(:faq, category: category, question: 'Foo?', answer: 'Bar')

    visit root_path
    click_link 'Domande frequenti'

    expect(page).to have_content 'Foo?'
    expect(page).to have_content 'Bar'
  end
end
