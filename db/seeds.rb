# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.

def import_call_rates
  created_rates = 0
  updated_rates = 0

  CSV.foreach(Rails.root.join('db', 'rates.csv'), headers: true) do |row|
    call_rate = CallRate.find_or_initialize_by(traffic_direction: row['traffic_direction']) do |rate|
      rate[:rate] = row['rate']
      rate[:time_slot] = row['time_slot']
    end

    if call_rate.new_record?
      created_rates += 1
    else
      updated_rates += 1
    end

    call_rate.save!
  end

  puts "Imported call rates: #{created_rates} created, #{updated_rates} updated."
end

import_call_rates
