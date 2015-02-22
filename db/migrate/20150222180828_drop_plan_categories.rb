class DropPlanCategories < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? :plan_categories
      drop_table :plan_categories
    end
  end
end
