# frozen_string_literal: true

class CallRate < ApplicationRecord
  extend Enumerize
  enumerize :time_slot, in: %i[flat peak off_peak]

  validates :traffic_direction, presence: true
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :time_slot, presence: true
end
