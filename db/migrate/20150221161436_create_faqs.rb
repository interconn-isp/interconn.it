# frozen_string_literal: true

class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.integer :category_id
      t.string :question
      t.text :answer
    end

    add_foreign_key :faqs, :faq_categories, column: :category_id
  end
end
