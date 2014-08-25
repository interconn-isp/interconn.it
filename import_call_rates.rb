require 'csv'

CallRate.transaction do
  CSV.foreach('rates.csv') do |line|
    traffic_direction = line[0]

    case line[1].to_i
    when 0
      time_slot = :flat
    when 1
      time_slot = :peak
    when 2
      time_slot = :off_peak
    else
      raise "Time slot #{line[1]} not recognized"
    end

    rate = line[2].gsub(',', '.').to_f

    puts "[#{traffic_direction}] Creating call rate (TS=#{time_slot.to_s}, R=#{rate.to_s})"

    CallRate.create!({
      traffic_direction: traffic_direction,
      rate: rate,
      time_slot: time_slot
    })
  end
end
