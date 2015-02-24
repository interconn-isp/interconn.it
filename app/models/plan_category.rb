class PlanCategory < ActiveYaml::Base
  field :name
  field :slug
  field :long_name
  field :description
  field :features, default: []
  field :visible, default: true

  include ActiveHash::Associations
  include ActiveYaml::Aliases

  has_many :plans, foreign_key: 'category_id'

  def to_param
    slug
  end
end
