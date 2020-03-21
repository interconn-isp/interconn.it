# frozen_string_literal: true

class AddTimeSlotToCallRate < ActiveRecord::Migration
  def change
    add_column :call_rates, :time_slot, :string, null: false
  end
end
