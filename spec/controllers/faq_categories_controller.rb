require 'rails_helper'

RSpec.describe FAQCategoriesController do
  describe "GET 'index'" do
    context 'when there is a category' do
      let!(:category) { FactoryGirl.create(:faq_category) }
      before(:each) { FactoryGirl.create(:faq, category: category) }

      it 'redirects to the the category' do
        get :index
        expect(response).to redirect_to(faq_category_path(category))
      end
    end

    context 'when there is no category' do
      it 'redirects to the home' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET 'show'" do
    let!(:category) { FactoryGirl.create(:faq_category) }

    context 'when the category has questions' do
      it 'loads the category' do
        get :show, id: category.slug
        expect(assigns(:category)).to eq(category)
      end
    end

    context 'when the category has no questions' do
      it 'redirects to the home' do
        get :show, id: category.slug
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
