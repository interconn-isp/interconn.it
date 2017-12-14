# frozen_string_literal: true

class FAQCategory < ActiveYaml::Base
  field :name
  field :slug

  include ActiveHash::Associations
  has_many :faqs, foreign_key: 'category_id'

  def to_param
    slug
  end
end
