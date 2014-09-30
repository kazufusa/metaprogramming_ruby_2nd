## Multiple Inclusions
module M1; end
module M2
  include M1
end
module M3
  prepend M1
  include M2
end
p M1.ancestors # => [M1]
p M2.ancestors # => [M2, M1]
p M3.ancestors # => [M1, M3, M2]

## Kernel
p Kernel.private_instance_methods.grep(/^pr/) # => [:printf, :print, :proc]

## The Awesome Print Example
require "awesome_print"
local_time = {City: "Rome", now: Time.now}
ap local_time, :indent => 2

## Method Execution
def my_method
  temp = @x + 1 # What object does the instance of @x belong to?
  my_other_method temp # What object should you call `my_other_method` on?
end

## The self Keyword
p self # => main # Every line of Ruby code is executed inside an object--current object as known `self`--.
p self.class # => Object
class MyClass
  def testing_self
    @var = 10   # An instance variable of self
    my_method() # Same as self.my_method()
    self
  end
  def my_method
    @var += 1
  end
end
obj = MyClass.new
p obj.testing_self # =>  #<MyClass:0x007fd438598d28 @var=11>

# What private Really Means
class C
  def public_method
    self.private_method # You can make this code work by removing `self` keyword
  end
  private
  def private_method
    'private_method'
  end
end
p C.new.public_method # => private method `private_method' called for #<C:0x007f2ff1ad4d00> (NoMethodError)...

# Class Definitions and self
class MyClass
  p self # => MyClass
end
