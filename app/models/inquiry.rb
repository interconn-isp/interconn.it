class Inquiry < ActiveRecord::Base
  extend Enumerize

  enumerize :product, in: %w(
    wadsl-7mega-privati wadsl-10mega-privati wadsl-4mega-business
    wadsl-7mega-business whdsl-2mega-1mega whdsl-2mega-2mega whdsl-4mega-2mega
    voip
  )

  validates :full_name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :phone, format: {
    with: /\A\+\d+\z/,
    allow_blank: true,
    message: I18n.t('activerecord.errors.messages.improbable_phone')
  }

  scope :stale, ->{ where '(EXTRACT(EPOCH FROM CURRENT_TIMESTAMP - created_at) / 3600) > 24' }
end
