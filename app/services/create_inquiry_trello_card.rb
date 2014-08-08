class CreateInquiryTrelloCard
  attr_reader :options

  SYMBOL_TO_DESC = {
    code: 'Codice richiesta',
    address: 'Indirizzo',
    full_name: 'Nome cliente',
    telephone: 'Telefono',
    email: 'Email',
    product: 'Prodotto',
    notes: 'Note',
    created_at: 'Data invio'
  }

  def initialize(options = {})
    @options = options
  end

  def create_inquiry_card(inquiry)
    inquiry = prepare_inquiry(inquiry)

    Trello::Card.create(
      name: inquiry[:address],
      desc: build_card_description(inquiry),
      list_id: options[:list_id]
    )
  end

  private

  def build_card_description(inquiry)
    SYMBOL_TO_DESC.each_key.map do |key|
      field_name = SYMBOL_TO_DESC[key]
      field_value = inquiry[key]

      next if field_value.blank?

      "- #{field_name}: **#{field_value}**"
    end.select{ |v| v.present? }.join("\n")
  end

  def prepare_inquiry(inquiry)
    inquiry = inquiry.symbolize_keys
    inquiry[:created_at] = inquiry[:created_at].strftime('%d/%m/%Y %H:%M')
    inquiry
  end
end
