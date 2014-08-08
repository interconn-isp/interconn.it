class CreateInquiryTrelloCardWorker
  include Sidekiq::Worker

  def perform(inquiry_id)
    service = InquiryTrelloManager.new(list_id: ENV['TRELLO_INQUIRIES_LIST_ID'])
    inquiry = Inquiry.find(inquiry_id)
    card = service.create_inquiry_card(inquiry.serializable_hash)
    inquiry.mark_as_processed!(card.id)
  end
end
