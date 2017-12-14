# frozen_string_literal: true

class Project < ActiveYaml::Base
  field :image
  field :name
  field :description
end
