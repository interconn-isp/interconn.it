class AddSentAtToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :sent_at, :datetime
  end
end
