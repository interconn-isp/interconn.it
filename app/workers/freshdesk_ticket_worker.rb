class FreshdeskTicketWorker
  include Sidekiq::Worker

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)

    freshdesk = Freshdesk.new(
      freshdesk_domain: ENV['FRESHDESK_DOMAIN'],
      freshdesk_api_key: ENV['FRESHDESK_API_KEY']
    )

    logger.info "Creating Freshdesk ticket for ticket #{ticket.id}"

    freshdesk_ticket = freshdesk.create_ticket(helpdesk_ticket: {
      requester_name: ticket.full_name,
      email: ticket.email,
      subject: ticket.subject,
      description: ticket.message
    })

    logger.info "Updating Freshdesk user #{freshdesk_ticket['helpdesk_ticket']['requester_id']} with new info"

    freshdesk.update_user(freshdesk_ticket['helpdesk_ticket']['requester_id'], user: {
      phone: ticket.phone
    }) if ticket.phone.present?

    logger.info "Finished processing ticket #{ticket.id}"

    ticket.destroy!
  end
end
