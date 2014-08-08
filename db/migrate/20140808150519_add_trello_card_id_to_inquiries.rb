class AddTrelloCardIdToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :trello_card_id, :string
  end
end
