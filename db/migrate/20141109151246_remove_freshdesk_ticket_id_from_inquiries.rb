class RemoveFreshdeskTicketIdFromInquiries < ActiveRecord::Migration
  def change
    remove_column :inquiries, :freshdesk_ticket_id, :integer
  end
end
