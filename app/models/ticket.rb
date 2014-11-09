class Ticket < ActiveRecord::Base
  extend Enumerize

  enumerize :category, in: [:billing, :info, :support]

  validates :full_name, presence: true
  validates :category, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :subject, presence: true, length: { minimum: 4 }
  validates :message, presence: true, length: { minimum: 10 }
  validates :phone, format: { with: /\A(\+|\d)+\z/, allow_blank: true, message: I18n.t('activerecord.errors.messages.improbable_phone') }

  def recipient
    ENV["#{category.to_s.upcase}_EMAIL"]
  end
end
