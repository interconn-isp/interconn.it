class ContactMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']

  def contact_email(contact_id)
    @contact = Contact.find(contact_id)

    mail(
      to: ENV['CONTACT_EMAIL'],
      reply_to: @contact.email,
      subject: 'Richiesta di supporto'
    )
  end
end
