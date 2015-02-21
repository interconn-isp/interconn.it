class FAQCategoriesController < ApplicationController
  respond_to :html

  def index
    if FAQCategory.any?
      redirect_to faq_category_path(FAQCategory.first)
    else
      redirect_to root_path
    end
  end

  def show
    @category = FAQCategory.friendly.find(params[:id])

    if @category.faqs.any?
      respond_with @category
    else
      redirect_to root_path
    end
  end
end
