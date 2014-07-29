class HomeController < ApplicationController
  def show
    @inquiry = Inquiry.new
  end
end
