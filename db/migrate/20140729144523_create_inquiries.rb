# frozen_string_literal: true

class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :code, null: false
      t.string :full_name
      t.string :telephone
      t.string :email
      t.text :address, null: false
      t.string :product
      t.text :notes
      t.boolean :processed, null: false, default: false

      t.timestamps
    end
  end
end
