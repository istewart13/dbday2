require_relative('pizza')

class Sales

  def initialize(pizzas)
    @pizzas = pizzas
  end

  def total_revenue
    total = 0
    @pizzas.each { |pizza| total += (pizza.quantity * 10) }
    return total
  end
end