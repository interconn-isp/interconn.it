# frozen_string_literal: true

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

  def self.visible
    all.select { |p| p.visible? || !Rails.env.production? }
  end

  def to_param
    slug
  end
end
