class ChangeFullNameAndEmailToNotNullInInquiries < ActiveRecord::Migration
  def change
    change_column :inquiries, :full_name, :string, null: false
    change_column :inquiries, :email, :string, null: false
  end
end
