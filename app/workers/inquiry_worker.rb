class InquiryWorker
  include Sidekiq::Worker

  def perform(inquiry_id)
    inquiry = Inquiry.find(inquiry_id)

    logger.info "Sending email for inquiry #{inquiry.id}..."

    InquiryMailer.inquiry_email(inquiry).deliver_now
    inquiry.update_column :sent_at, Time.now

    logger.info "Finished processing inquiry #{inquiry.id}!"
  end
end
