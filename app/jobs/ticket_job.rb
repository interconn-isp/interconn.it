# frozen_string_literal: true

class TicketJob < ApplicationJob
  queue_as :default

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)

    logger.info "Sending email for #{ticket.id}..."

    TicketMailer.ticket_email(ticket).deliver_now
    ticket.update_column :sent_at, Time.zone.now

    logger.info "Finished processing ticket #{ticket.id}!"
  end
end
