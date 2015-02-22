class PlanCategory < ActiveYaml::Base
  field :name
  field :slug

  include ActiveHash::Associations
  has_many :plans, foreign_key: 'category_id'

  def to_param
    slug
  end
end
