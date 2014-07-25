class ContactsWorker
  include Sidekiq::Worker

  def perform
    Contact.unprocessed.each do |contact|
      ContactMailer.contact_email(contact).deliver
      contact.mark_as_processed!
    end
  end
end
