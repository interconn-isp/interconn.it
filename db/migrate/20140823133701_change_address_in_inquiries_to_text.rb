class ChangeAddressInInquiriesToText < ActiveRecord::Migration
  def change
    change_column :inquiries, :address, :text, null: true
  end
end
