# frozen_string_literal: true

class ContractArticle < ActiveYaml::Base
  field :name
  field :content
  field :summary
end
