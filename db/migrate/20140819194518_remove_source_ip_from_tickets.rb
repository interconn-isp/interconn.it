class RemoveSourceIpFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :source_ip, :string, null: false
  end
end
