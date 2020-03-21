# frozen_string_literal: true

class RenameContactsToTickets < ActiveRecord::Migration
  def change
    rename_table :contacts, :tickets
  end
end
