require 'rails_helper'

RSpec.describe PlanCategoriesController do
  let(:category) do
    PlanCategory.new(slug: 'foo')
  end

  describe "GET 'index'" do
    before(:each) do
      PlanCategory
        .expects(:first)
        .once
        .returns(category)
    end

    it 'redirects to the the first category' do
      get :index
      expect(response).to redirect_to(faq_category_path(category))
    end
  end

  describe "GET 'show'" do
    before(:each) do
      PlanCategory
        .expects(:find_by_slug!)
        .once
        .with(category.slug)
        .returns(category)
    end

    it 'loads the category' do
      get :show, id: category.slug
      expect(assigns(:category).slug).to eq(category.slug)
    end
  end
end
