class Ticket < ActiveRecord::Base
  extend Enumerize

  enumerize :category, in: {
    billing: ENV['FRESHDESK_BILLING_GROUP'],
    info:    ENV['FRESHDESK_INFO_GROUP'],
    support: ENV['FRESHDESK_SUPPORT_GROUP']
  }

  validates :full_name, presence: true
  validates :category, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :subject, presence: true, length: { minimum: 4 }
  validates :message, presence: true, length: { minimum: 10 }
  validates :phone, format: { with: /\A(\+|\d)+\z/, allow_blank: true, message: I18n.t('activerecord.errors.messages.improbable_phone') }
end
