module ApplicationHelper
  def arbre(&block)
    Arbre::Context.new(&block).to_s
  end
end
