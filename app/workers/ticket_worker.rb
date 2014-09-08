class TicketWorker
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
      description_html: build_ticket_description(ticket),
      group_id: ticket.category.value
    })

    logger.info "Finished processing ticket #{ticket.id}"

    ticket.destroy!
  end

  def build_ticket_description(ticket)
    description = I18n.t('workers.ticket.description_html.message',
      message: ERB::Util.html_escape(ticket.message)
    )

    if ticket.phone.present?
      description += I18n.t('workers.ticket.description_html.phone',
        phone: ERB::Util.html_escape(ticket.phone)
      )
    end

    description
  end
end
