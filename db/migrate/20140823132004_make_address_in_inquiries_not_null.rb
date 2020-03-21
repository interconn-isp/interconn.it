# frozen_string_literal: true

class MakeAddressInInquiriesNotNull < ActiveRecord::Migration
  def change
    change_column :inquiries, :address, :text, null: true
  end
end
