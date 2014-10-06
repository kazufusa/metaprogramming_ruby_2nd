# Calling Methods Dynamically
class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
  private
  def my_private_method
    "my_private_method"
  end
end
obj = MyClass.new
p obj.my_method(3) # => 6
p obj.send(:my_method, 3) # => 6

p "A".send :length # => 1
p "A".send "+", "B" # => "AB"
p 1.send :+, 1 # +=> 2
p 1.respond_to? :+

# Privacy Matters
p obj.send(:my_private_method) # => "my_private_method"
# p obj.public_send(:my_private_method) # => NoMethodError

# Defining Methods Dynamically
class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end
obj = MyClass.new
p obj.my_method(3) # => 9

# Refactoring the Computer Class
## step 1: Adding Dynamic Dispatches
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def mouse
    component :mouse
  end

  def cpu
    component :cpu
  end

  def keyboard
    component keyboard
  end

  def component(name)
    info = @data_source.send "get_#{name}_info", @id
    price = @data_source.send "get_#{name}_price", @id
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end
my_computer = Computer.new(42, DS.new)
p my_computer.cpu # => "* Cpu: 2.16 Ghz ($220)"

## step 2: Generating Methods Dynamically
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def self.define_compnent(name)
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    end
  end

  define_compnent :mouse
  define_compnent :cpu
  define_compnent :keyboard
end

## step 3: Sprinkling the Code with Introspection
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) {Computer::define_component $1}
  end

  def self.define_compnent(name)
    define_method(name) do
      # ...
    end
  end
end

