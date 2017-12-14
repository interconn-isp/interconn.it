# frozen_string_literal: true

class Plan < ActiveYaml::Base
  field :category_id
  field :name
  field :full_name
  field :slug
  field :vat_included, default: true
  field :monthly_cost
  field :features, default: []

  include ActiveHash::Associations
  include ActiveYaml::Aliases

  belongs_to :category, class_name: 'PlanCategory', foreign_key: 'category_id'

  def full_name
    if category
      "#{category.name} #{name}"
    else
      name
    end
  end
end
