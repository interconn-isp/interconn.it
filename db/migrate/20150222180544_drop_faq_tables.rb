# frozen_string_literal: true

class DropFAQTables < ActiveRecord::Migration
  def change
    drop_table :faqs
    drop_table :faq_categories
  end
end
