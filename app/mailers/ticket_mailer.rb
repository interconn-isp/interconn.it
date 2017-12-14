# frozen_string_literal: true

class TicketMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']

  def ticket_email(ticket)
    @ticket = ticket

    mail(
      to: ENV['TICKETS_EMAIL'],
      subject: ticket.subject,
      reply_to: "#{ticket.full_name} <#{ticket.email}>"
    )
  end
end
