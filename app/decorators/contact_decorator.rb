class ContactDecorator < Draper::Decorator
  delegate_all

  def email
    h.mail_to object.email
  end

  def message
    h.simple_format object.message
  end
end
