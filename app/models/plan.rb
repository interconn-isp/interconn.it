class Plan < ActiveYaml::Base
  field :category_id
  field :name
  field :slug
  field :vat_included, default: true
  field :monthly_cost
  field :features, default: []

  include ActiveHash::Associations
  belongs_to :category, class_name: 'PlanCategory', foreign_key: 'category_id'
end
