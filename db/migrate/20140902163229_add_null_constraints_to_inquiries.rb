# frozen_string_literal: true

class AddNullConstraintsToInquiries < ActiveRecord::Migration
  def change
    change_column :inquiries, :phone, :string, null: false
    change_column :inquiries, :address, :string, null: false
  end
end
