class RemoveTrelloCardIdFromInquiries < ActiveRecord::Migration
  def change
    remove_column :inquiries, :trello_card_id, :string
  end
end
