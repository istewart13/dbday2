require('pry-byebug')
require('pg')

class Pizza
  attr_accessor :id, :first_name, :last_name, :topping, :quantity

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @topping = options['topping']
    @quantity = options['quantity'].to_i
  end

  def save
    db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'} )
    sql = "INSERT INTO pizzas (first_name, last_name, topping, quantity)
           VALUES ('#{ @first_name }',
           '#{ @last_name }',
           '#{ @topping }',
           '#{ @quantity }'
           );"
    db.exec(sql)
    db.close
  end

  def self.all()
    db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'} )
    sql = "SELECT * FROM pizzas"
    pizzas = db.exec(sql)
    db.close
    pizza_array = pizzas.map { |pizza| Pizza.new(pizza) }
    return pizza_array
  end

  def self.delete_all()
    db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'} )
    sql = "DELETE FROM pizzas"
    db.exec(sql)
    db.close
  end

  def self.delete(id)
    db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'} )
    sql = "DELETE FROM pizzas WHERE id = #{id}"
    db.exec(sql)
    db.close
  end

  def self.update(attribute, update_info, id)
    db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'} )
    sql = "UPDATE pizzas SET #{attribute} = '#{update_info}' WHERE id = #{id}"
    db.exec(sql)
    db.close
  end


end