class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.source_ip = request.remote_ip

    @contact.save

    render :new
  end

  protected

  def contact_params
    params.require(:contact).permit(:full_name, :phone, :email, :message)
  end
end
