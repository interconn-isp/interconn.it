class AddStatusToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :status, :string, null: false
  end
end
