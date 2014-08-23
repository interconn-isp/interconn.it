class FreshdeskInquiryCreationWorker
  include Sidekiq::Worker

  def perform(inquiry_id)
    inquiry = Inquiry.find(inquiry_id)

    freshdesk = Freshdesk.new(
      freshdesk_domain: ENV['FRESHDESK_DOMAIN'],
      freshdesk_api_key: ENV['FRESHDESK_API_KEY']
    )

    logger.info "Creating Freshdesk ticket for inquiry #{inquiry.id}"

    freshdesk_ticket = freshdesk.create_ticket(helpdesk_ticket: {
      requester_name: inquiry.full_name,
      email: inquiry.email,
      subject: I18n.t('workers.freshdesk_inquiry_creation.ticket.subject'),
      description: I18n.t('workers.freshdesk_inquiry_creation.ticket.description'),
      group_id: ENV['FRESHDESK_INFO_GROUP'],
      ticket_type: ENV['FRESHDESK_INQUIRY_TYPE'],
      priority: ENV['FRESHDESK_INQUIRY_PRIORITY']
    })

    inquiry.update_column :freshdesk_ticket_id, freshdesk_ticket['helpdesk_ticket']['id']

    logger.info "Finished processing inquiry #{inquiry.id}"
  end
end
