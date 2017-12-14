# frozen_string_literal: true

class TeamMember < ActiveYaml::Base
  field :name
  field :role
  field :slug
end
