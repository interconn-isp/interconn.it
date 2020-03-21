# frozen_string_literal: true

class RemoveNonFreshdeskColumnsFromInquiries < ActiveRecord::Migration
  def change
    remove_column :inquiries, :code, :string, null: false
    remove_column :inquiries, :status, :string, null: false
  end
end
