json.array! @call_rates do |call_rate|
  json.traffic_direction call_rate.traffic_direction
  json.rate number_with_precision(call_rate.rate, precision: 2, separator: ',')
  json.time_slot call_rate.time_slot
end
