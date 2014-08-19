class AddSubjectToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :subject, :string, null: false
  end
end
