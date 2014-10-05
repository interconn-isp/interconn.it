class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
    @inquiry.product = params[:product]
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      InquiryWorker.perform_async @inquiry.id
      render :created
    else
      render :new
    end
  end

  protected

  def inquiry_params
    params.require(:inquiry).permit(
      :full_name, :phone, :email, :address, :product, :notes
    )
  end
end
