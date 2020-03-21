# frozen_string_literal: true

class ChangeAddressInInquiriesToString < ActiveRecord::Migration
  def change
    change_column :inquiries, :address, :string
  end
end
