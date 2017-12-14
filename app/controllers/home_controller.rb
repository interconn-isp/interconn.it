# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @inquiry = Inquiry.new
    @inquiry.product = params[:product]
  end
end
