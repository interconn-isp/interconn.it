class Ticket < ActiveRecord::Base
  validates :full_name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :subject, presence: true, length: { minimum: 4 }
  validates :message, presence: true, length: { minimum: 10 }
  validates :phone, format: { with: /\A(\+|\d)+\z/, allow_blank: true, message: I18n.t('activerecord.errors.messages.improbable_phone') }
end
