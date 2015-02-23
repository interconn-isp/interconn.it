class FAQCategoriesController < ApplicationController
  respond_to :html

  def index
    redirect_to faq_category_path(FAQCategory.first)
  end

  def show
    @category = FAQCategory.find_by_slug!(params[:id])
    respond_with @category
  end
end
