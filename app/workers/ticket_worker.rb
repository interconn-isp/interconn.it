class TicketWorker
  include Sidekiq::Worker

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)

    logger.info "Sending email for #{ticket.id}..."
    TicketMailer.ticket_email(ticket).deliver
    logger.info "Finished processing ticket #{ticket.id}!"
  end
end
