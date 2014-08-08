class UpdateInquiryTrelloCardWorker
  include Sidekiq::Worker

  def perform(inquiry_id)
    service = InquiryTrelloManager.new(list_id: ENV['TRELLO_INQUIRIES_LIST_ID'])
    inquiry = Inquiry.find(inquiry_id)
    service.update_inquiry_card(inquiry.trello_card_id, inquiry.serializable_hash)
  end
end
