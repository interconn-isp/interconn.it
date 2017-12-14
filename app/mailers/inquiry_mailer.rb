# frozen_string_literal: true

class InquiryMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']

  def inquiry_email(inquiry)
    @inquiry = inquiry

    mail(
      to: ENV['INQUIRIES_EMAIL'],
      subject: I18n.t('mailers.inquiry.subject', full_name: inquiry.full_name),
      reply_to: "#{inquiry.full_name} <#{inquiry.email}>"
    )
  end
end
