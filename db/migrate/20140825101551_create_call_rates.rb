# frozen_string_literal: true

class CreateCallRates < ActiveRecord::Migration
  def change
    create_table :call_rates do |t|
      t.string :traffic_direction, null: false
      t.decimal :rate, precision: 10, scale: 8, null: false
    end
  end
end
