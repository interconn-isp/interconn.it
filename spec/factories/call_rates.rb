# frozen_string_literal: true

FactoryBot.define do
  factory :call_rate do
    sequence(:traffic_direction) { |n| "Direction #{n}" }
    rate { rand(0.0..0.9) }
    time_slot { CallRate.time_slot.values.sample }
  end
end
