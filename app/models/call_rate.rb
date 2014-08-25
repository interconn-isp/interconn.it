class CallRate < ActiveRecord::Base
  extend Enumerize
  enumerize :time_slot, in: [:flat, :peak, :off_peak]

  validates :traffic_direction, presence: true
  validates :rate, presence: true, numericality: true
  validates :time_slot, presence: true
end
