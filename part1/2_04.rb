# What"s in an Object
class MyClass
  def my_method
    @v = 1
  end
end
obj = MyClass.new
p obj.class # => MyClass

# Instance Variables
p obj.instance_variables # => []
obj.my_method
p obj.instance_variables # => [:@v]

# Methods
p obj.methods.grep(/my/) # => [:my_method]

p String.instance_methods == "abc".methods # => true
p String.methods == "abc".methods # => false

# The Truth About Classes
p "hello".class # => String
p String.class # => Class
p Class.instance_methods false # => [:allocate, :new, :superclass]

p Array.superclass # => Object
p Object.superclass # => BasicObject
p BasicObject.superclass # => nil

# Modules
p Class.superclass # => Module
# Usually, you pick a module when you mean it to be included somewhere, and you pick a class when you mean it to be instantiated or inherited.
