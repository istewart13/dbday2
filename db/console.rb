require_relative('../models/pizza')
require_relative('../models/sales')
require('pry-byebug')


pizza1 = Pizza.new('first_name' => 'Luke', 'last_name' => 'Skywalker', 'topping' => 'Calzone', 'quantity' => 4)
pizza2 = Pizza.new('first_name' => 'Darth', 'last_name' => 'Vader', 'topping' => 'Calzone', 'quantity' => 2)
pizza_array = [pizza1, pizza2]

# pizza_array = [pizza1, pizza2]
# pizza_array.each { |pizza| pizza.save }

pizza1.save()
pizza2.save()

pizzas = Pizza.all()
#Pizza.delete(1)
Pizza.update('topping', 'pepperoni', 1)

#Pizza.delete_all()
#pizza1.delete()


#pizza_array.delete(1)
#sales = Sales.new(pizzas)

binding.pry
nil