# frozen_string_literal: true

class RemoveCategoryFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :category, :string, null: false
  end
end
