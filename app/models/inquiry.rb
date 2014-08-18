class Inquiry < ActiveRecord::Base
  extend Enumerize

  enumerize :product, in: %w(
    wadsl-7mega-privati wadsl-10mega-privati wadsl-4mega-business
    wadsl-7mega-business whdsl-2mega-1mega whdsl-2mega-2mega whdsl-4mega-2mega
    voip
  )

  enumerize :status, in: [:requested, :completed, :infeasible], default: :requested

  validates :address, :status, presence: true

  validates :email, presence: { if: ->{ telephone.blank? } }
  validates :telephone, presence: { if: ->{ email.blank? } }

  before_create :set_code

  status.values.each do |value|
    scope value, -> { where status: value }
  end

  attr_reader :telephone_or_email

  def telephone_or_email=(telephone_or_email)
    @telephone_or_email = telephone_or_email

    if /@/ =~ telephone_or_email
      self.email = telephone_or_email
    else
      self.telephone = telephone_or_email
    end
  end

  protected

  def set_code
    self.code = SecureRandom.hex[0..7].upcase
  end
end
