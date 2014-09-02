class InquiryWorker
  include Sidekiq::Worker

  def initialize
    @freshdesk = Freshdesk.new(
      freshdesk_domain: ENV['FRESHDESK_DOMAIN'],
      freshdesk_api_key: ENV['FRESHDESK_API_KEY']
    )
  end

  def perform(inquiry_id)
    inquiry = Inquiry.find(inquiry_id)

    logger.info "Creating Freshdesk ticket for inquiry #{inquiry.id}"
    create_ticket(inquiry)

    logger.info "Finished processing inquiry #{inquiry.id}"
    inquiry.destroy!
  end

  protected

  def create_ticket(inquiry)
    freshdesk_ticket = @freshdesk.create_ticket(helpdesk_ticket: {
      requester_name: inquiry.full_name,
      email: inquiry.email,
      subject: I18n.t('workers.inquiry.subject'),
      description_html: build_ticket_description(inquiry),
      group_id: ENV['FRESHDESK_INFO_GROUP'],
      ticket_type: ENV['FRESHDESK_INQUIRY_TYPE'],
      priority: ENV['FRESHDESK_INQUIRY_PRIORITY']
    })

    freshdesk_ticket
  end

  private

  def build_ticket_description(inquiry)
    description = ''

    if inquiry.phone.present?
      description += I18n.t('workers.inquiry.description_html.phone',
        phone: inquiry.phone
      )
    end

    if inquiry.address.present?
      description += I18n.t('workers.inquiry.description_html.address',
        address: inquiry.address
      )
    end

    if inquiry.product.present?
      description += I18n.t('workers.inquiry.description_html.product',
        product: inquiry.product.text
      )
    end

    if inquiry.notes.present?
      description += I18n.t('workers.inquiry.description_html.notes',
        notes: inquiry.notes
      )
    end

    description
  end
end
