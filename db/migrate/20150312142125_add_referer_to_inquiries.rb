# frozen_string_literal: true

class AddRefererToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :referer, :string
  end
end
