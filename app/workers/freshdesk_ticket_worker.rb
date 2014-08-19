class FreshdeskTicketWorker
  include Sidekiq::Worker

  def perform(ticket_id)
    ticket = Ticket.find(ticket_id)

    freshdesk = Freshdesk.new(
      freshdesk_domain: ENV['FRESHDESK_DOMAIN'],
      freshdesk_api_key: ENV['FRESHDESK_API_KEY']
    )

    freshdesk_ticket = freshdesk.create_ticket(helpdesk_ticket: {
      requester_name: ticket.full_name,
      email: ticket.email,
      subject: 'Richiesta di supporto',
      description: ticket.message
    })

    ticket.destroy!

    logger.info "Ticket #{freshdesk_ticket['helpdesk_ticket']['id']} created in Freshdesk"
  end
end
