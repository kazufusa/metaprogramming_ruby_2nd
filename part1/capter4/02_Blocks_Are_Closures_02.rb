## Scope

## Changing Scope
v1 = 1
class MyClass
  v2 = 2
  p local_variables # => [:v2]
  def my_method
    v3 = 3
    p local_variables
  end
  p local_variables # => [:v2]
end
obj = MyClass.new
obj.my_method # => [:v3]
obj.my_method # => [:v3]
p local_variables # => [:v1, :obj]

## Global Variables and Top-Level Variables
def a_scope
  $var = 'some value'
end
def another_scope
  $var
end
a_scope
p another_scope # => "some value"

@var = 'The top-level @var'
def my_method
  @var
end
p my_method # => "The top-level @var"

## Flatten the scope
my_var = "Success"
MyClass1 = Class.new do
  puts "#{my_var} in the secret definition!"

  define_method :my_method do
    "#{my_var} in the method!"
  end
end

puts MyClass1.new.my_method

class MyClass
  def my_method
    @var = "This is not the top-level @var!"
  end

  def my_another_method
    @var
  end
end
my_obj = MyClass.new
my_obj.my_method
p my_obj.my_another_method

puts MyClass2.new.my_method

## sharing the scope
def define_methods
  shared = 0
  Kernel.send :define_method, :counter do
    shared
  end
  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end
define_methods
puts counter
inc 3
puts counter
