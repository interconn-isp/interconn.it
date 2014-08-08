class InquiriesController < ApplicationController
  before_filter :load_current_inquiry, only: [:edit, :update]

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      session[:inquiry_code] = @inquiry.code
      CreateInquiryTrelloCardWorker.perform_async(@inquiry.id)
      redirect_to edit_inquiry_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @inquiry.update(inquiry_params)
      session.delete :inquiry_code
      UpdateInquiryTrelloCardWorker.perform_async(@inquiry.id)
      render :updated
    else
      render :edit
    end
  end

  protected

  def inquiry_params
    params.require(:inquiry).permit(
      :full_name, :telephone, :email, :telephone_or_email,
      :address, :product, :notes
    )
  end

  def load_current_inquiry
    unless session[:inquiry_code]
      redirect_to root_path
      return false
    end

    @inquiry = Inquiry.find_by_code(session[:inquiry_code])

    unless @inquiry
      redirect_to root_path
      return false
    end
  end
end
