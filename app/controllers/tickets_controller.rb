# frozen_string_literal: true

class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    TicketJob.perform_later(@ticket.id) if @ticket.save

    render :new
  end

  protected

  def ticket_params
    params.require(:ticket).permit(:full_name, :phone, :email, :message, :subject)
  end
end
