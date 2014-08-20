class Ticket < ActiveRecord::Base
  extend Enumerize

  enumerize :category, in: {
    billing: ENV['FRESHDESK_BILLING_GROUP'],
    info:    ENV['FRESHDESK_INFO_GROUP'],
    support: ENV['FRESHDESK_SUPPORT_GROUP']
  }

  validates :full_name, :email, :message, :subject, :category, presence: true
  validates :email, format: { with: /@/ }
  validates :subject, length: { minimum: 4 }
  validates :message, length: { minimum: 10 }
end
