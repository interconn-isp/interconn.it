class InquiriesWorker
  include Sidekiq::Worker

  def perform
    service = CreateInquiryTrelloCard.new(list_id: ENV['TRELLO_INQUIRIES_LIST_ID'])

    Inquiry.unprocessed.each do |inquiry|
      service.create_inquiry_card(inquiry.serializable_hash)
      inquiry.mark_as_processed!
    end
  end
end
