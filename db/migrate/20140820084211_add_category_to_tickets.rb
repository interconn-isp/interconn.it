# frozen_string_literal: true

class AddCategoryToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :category, :string, null: false
  end
end
