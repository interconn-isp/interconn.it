class FreshdeskInquiryUpdateWorker
  include Sidekiq::Worker

  def perform(inquiry_id)
    inquiry = Inquiry.find(inquiry_id)

    freshdesk = Freshdesk.new(
      freshdesk_domain: ENV['FRESHDESK_DOMAIN'],
      freshdesk_api_key: ENV['FRESHDESK_API_KEY']
    )

    logger.info "Updating Freshdesk ticket #{inquiry.freshdesk_ticket_id} for inquiry #{inquiry.id}"

    note_body = build_note_body(inquiry)

    freshdesk_ticket = freshdesk.add_note_to_ticket(inquiry.freshdesk_ticket_id, helpdesk_note: {
      body_html: note_body,
      private: false
    }) unless note_body.blank?

    if inquiry.telephone.present?
      requester_id = freshdesk.get_ticket(inquiry.freshdesk_ticket_id)['helpdesk_ticket']['requester_id']

      logger.info "Updating Freshdesk user #{requester_id}"

      freshdesk.update_user(requester_id, user: {
        phone: inquiry.telephone
      })
    end

    inquiry.destroy!

    logger.info "Finished processing inquiry #{inquiry.id}"
  end

  private

  def build_note_body(inquiry)
    description = ''

    if inquiry.address.present?
      description += I18n.t('workers.freshdesk_inquiry_update.note_html.address', address: inquiry.address)
    end

    if inquiry.product.present?
      description += I18n.t('workers.freshdesk_inquiry_update.note_html.product', product: inquiry.product.text)
    end

    if inquiry.notes.present?
      description += I18n.t('workers.freshdesk_inquiry_update.note_html.notes', notes: inquiry.notes)
    end

    description
  end
end
