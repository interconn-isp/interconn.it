class RemoveProcessedFromInquiries < ActiveRecord::Migration
  def change
    remove_column :inquiries, :processed, :boolean
  end
end
