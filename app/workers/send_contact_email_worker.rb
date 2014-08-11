class SendContactEmailWorker
  include Sidekiq::Worker

  def perform(contact_id)
    contact = Contact.find(contact_id)
    ContactMailer.contact_email(contact).deliver
    contact.mark_as_processed!
  end
end
