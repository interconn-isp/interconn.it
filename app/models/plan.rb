class Plan < ActiveYaml::Base
  field :category_id
  field :name

  include ActiveHash::Associations
  belongs_to :category, class_name: 'PlanCategory', foreign_key: 'category_id'
end
