class RenameTelephoneToPhoneInInquiries < ActiveRecord::Migration
  def change
    rename_column :inquiries, :telephone, :phone
  end
end
