class RemoveProcessedFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :processed, :boolean, null: false
  end
end
