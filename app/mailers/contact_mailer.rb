class ContactMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']

  def contact_email(contact)
    @contact = contact

    mail(
      to: ENV['CONTACT_EMAIL'],
      reply_to: @contact.email,
      subject: 'Richiesta di supporto'
    )
  end
end
