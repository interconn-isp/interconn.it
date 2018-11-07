# frozen_string_literal: true

module ApplicationHelper
  def arbre(&block)
    Arbre::Context.new(&block).to_s
  end

  def full_page_title(title)
    title.present? ? "#{title} | InterConn" : 'InterConn'
  end
end
