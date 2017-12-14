# frozen_string_literal: true

module ApplicationHelper
  def arbre(&block)
    Arbre::Context.new(&block).to_s
  end
end
