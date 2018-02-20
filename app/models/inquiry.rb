# frozen_string_literal: true

class Inquiry < ApplicationRecord
  extend Enumerize

  enumerize :product, in: Plan.visible.map(&:slug)

  validates :full_name, presence: true
  validates :email, presence: true, format: { with: /@/ }
  validates :phone, presence: true, format: { with: /\A(\+|\d)+\z/, allow_blank: true }
  validates :address, presence: true
  validates :product, presence: true
end
