# frozen_string_literal: true

class AddSentAtToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :sent_at, :datetime
  end
end
