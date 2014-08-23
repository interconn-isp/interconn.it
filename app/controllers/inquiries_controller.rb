class InquiriesController < ApplicationController
  before_filter :load_current_inquiry, only: [:edit, :update]

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      session[:inquiry_id] = @inquiry.id
      redirect_to edit_inquiry_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @inquiry.update(inquiry_params)
      session.delete :inquiry_id
      render :updated
    else
      render :edit
    end
  end

  protected

  def inquiry_params
    params.require(:inquiry).permit(
      :full_name, :telephone, :email, :address, :product, :notes
    )
  end

  def load_current_inquiry
    unless session[:inquiry_id]
      redirect_to root_path
      return false
    end

    @inquiry = Inquiry.find(session[:inquiry_id])

    unless @inquiry
      redirect_to root_path
      return false
    end
  end
end
