class AddRefererToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :referer, :string
  end
end
