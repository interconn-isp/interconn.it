class StaleInquiriesWorker
  include Sidekiq::Worker

  def perform
    Inquiry.stale.destroy_all
  end
end
