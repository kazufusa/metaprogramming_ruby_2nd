class MyClass
  def initialize(value)
    @v = value
  end
  def my_method
    @v
  end
end
obj = MyClass.new(1)
m = obj.method :my_method
p m #=> #<Method: MyClass#my_method>
p m.call #=> 1
p m.to_proc
p m.call #=> 1

# Unbound methods
module MyModule
  def my_method
    42
  end
end
unbound = MyModule.instance_method :my_method
p unbound.class #=> UnboundMethod
String.class_eval do
  define_method :another_method, unbound
end
p "ABC".another_method #=> 42
String.class_eval do
  define_method :some_method do
    24
  end
end
p "ABC".some_method #=> 24
