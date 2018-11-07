# frozen_string_literal: true

class PlanCategoriesController < ApplicationController
  respond_to :html

  def index
    redirect_to plan_category_path(PlanCategory.first)
  end

  def show
    @category = PlanCategory.find_by_slug(params[:id])
    fail ActiveRecord::RecordNotFound unless @category

    respond_with @category
  end
end
