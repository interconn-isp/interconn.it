# frozen_string_literal: true

class CreateFAQCategories < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.string :name, null: false
    end

    add_index :faq_categories, :name, unique: true
  end
end
