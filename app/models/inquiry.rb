class Inquiry < ActiveRecord::Base
  extend Enumerize

  enumerize :product, in: Plan.all.map(&:slug)

  validates :full_name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :phone, presence: true, format: { with: /\A(\+|\d)+\z/, allow_blank: true }
  validates :address, presence: true
end
