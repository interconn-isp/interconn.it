class FAQCategoriesController < ApplicationController
  respond_to :html

  def index
    if FAQCategory.count > 0
      redirect_to faq_category_path(FAQCategory.first)
    else
      redirect_to root_path
    end
  end

  def show
    @category = FAQCategory.find_by_slug(params[:id])

    if @category.faqs.count > 0
      respond_with @category
    else
      redirect_to root_path
    end
  end
end
