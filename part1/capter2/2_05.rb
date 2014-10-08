# Putting It All Together
class MyClass; end
obj1 = MyClass.new
obj2 = MyClass.new

my_class = MyClass
obj3 = my_class.new
p obj1, obj2, obj3

# Constants
module MyModule
  MyConstant = 'Outer constant'
  class MyClass
    MyConstant = 'Inner constant'
  end
end
p MyModule::MyConstant
p MyModule::MyClass::MyConstant

# The Paths of Constants
module M
  class C
    X = 'a constant'
  end
  p C::X # => "a constant"
end
p M::C::X # => "a constant"

Y = 'a root-level constant'
module M
  Y = 'a constant in M'
  p Y # => "a constant in M"
  p ::Y # => "a root-level constant"
end

p M.constants # => [:C, :Y]
p Module.constants.include? :Object # => true
p Module.constants.include? :Module # => true

module M
  class C
    module M2
      p Module.nesting # => [M::C::M2, M::C, M]
    end
  end
end

# The Rake Example

# Using Namespaces
module Text; end
# class Text; end # => Text is not a class (TypeError)
module Bookworm
  class Text
  end
end
