# frozen_string_literal: true

require 'csv'

namespace :call_rates do
  desc 'Imports call rates from a CSV file'
  task import: :environment do
    file = ENV['FILE']
    truncate = ENV['TRUNCATE'].present?

    CallRate.transaction do
      if truncate
        puts "Truncating table #{CallRate.table_name}"
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{CallRate.table_name} RESTART IDENTITY")
      end

      count = 0

      CSV.foreach(file) do |line|
        traffic_direction = line[0]

        case line[1].to_i
        when 0
          time_slot = :flat
        when 1
          time_slot = :peak
        when 2
          time_slot = :off_peak
        else
          fail "Time slot #{line[1]} not recognized"
        end

        rate = line[2].tr(',', '.').to_f

        call_rate = CallRate.create!(
          traffic_direction: traffic_direction,
          rate: rate,
          time_slot: time_slot,
)

        puts "##{call_rate.id} [TD='#{traffic_direction}', TS='#{time_slot}', R=#{rate}]"

        count += 1
      end

      puts "#{count} records imported"
    end
  end
end
