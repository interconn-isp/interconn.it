# frozen_string_literal: true

class AddFreshdeskTicketIdToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :freshdesk_ticket_id, :string
  end
end
