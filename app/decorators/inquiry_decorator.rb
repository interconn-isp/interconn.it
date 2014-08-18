class InquiryDecorator < Draper::Decorator
  include ApplicationHelper

  STATUS_MAP = {
    requested:  :default,
    completed:  :completed,
    infeasible: :error
  }

  delegate_all

  def address
    h.simple_format object.address
  end

  def email
    h.mail_to object.email
  end

  def product
    object.product.text if object.product.present?
  end

  def notes
    h.simple_format object.notes if object.notes.present?
  end

  def status
    inquiry = object

    arbre do
      status_tag inquiry.status.text, STATUS_MAP[inquiry.status.to_sym]
    end
  end
end
