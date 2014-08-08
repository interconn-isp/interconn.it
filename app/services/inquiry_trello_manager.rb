class InquiryTrelloManager
  SYMBOL_TO_DESC = {
    code: 'Codice richiesta',
    full_name: 'Nome cliente',
    telephone: 'Telefono cliente',
    email: 'Email cliente',
    product: 'Prodotto richiesto',
    created_at: 'Data invio'
  }

  attr_reader :options

  def initialize(options = {})
    @options = options
  end

  def create_inquiry_card(inquiry)
    inquiry = prepare_inquiry(inquiry)

    Trello::Card.create(
      name: inquiry[:address],
      desc: build_card_desc(inquiry),
      list_id: options[:list_id]
    )
  end

  def update_inquiry_card(card_id, inquiry)
    inquiry = prepare_inquiry(inquiry)

    card = Trello::Card.find(card_id)
    card.desc = build_card_desc(inquiry)
    card.update!
  end

  private

  def build_card_desc(inquiry)
    desc_parts = SYMBOL_TO_DESC.each_key.map do |key|
      field_name = SYMBOL_TO_DESC[key]
      field_value = inquiry[key]

      next if field_value.blank?

      "- #{field_name}: **#{field_value}**"
    end

    desc_parts << "\nIndirizzo:\n\n```\n#{inquiry[:address]}\n```"
    desc_parts << "\nNote:\n\n```\n#{inquiry[:notes]}\n```" unless inquiry[:notes].blank?

    desc_parts.select{ |v| v.present? }.join("\n")
  end

  def prepare_inquiry(inquiry)
    inquiry = inquiry.symbolize_keys
    inquiry[:product] = I18n.t("enumerize.inquiry.product.#{inquiry[:product]}")
    inquiry[:created_at] = inquiry[:created_at].strftime('%d/%m/%Y %H:%M')
    inquiry
  end
end
