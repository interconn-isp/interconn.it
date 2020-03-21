# frozen_string_literal: true

class FAQCategoriesController < ApplicationController
  respond_to :html

  def index
    redirect_to faq_category_path(FAQCategory.first)
  end

  def show
    @category = FAQCategory.find_by(slug: params[:id])
    fail ActiveRecord::RecordNotFound unless @category

    respond_with @category
  end
end
