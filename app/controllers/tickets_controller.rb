class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      FreshdeskTicketWorker.perform_async(@ticket.id)
    end

    render :new
  end

  protected

  def ticket_params
    params.require(:ticket).permit(:full_name, :phone, :email, :message, :subject)
  end
end
