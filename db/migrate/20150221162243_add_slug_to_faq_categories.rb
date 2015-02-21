class AddSlugToFAQCategories < ActiveRecord::Migration
  def change
    add_column :faq_categories, :slug, :string, null: false
    add_index :faq_categories, :slug, unique: true
  end
end
