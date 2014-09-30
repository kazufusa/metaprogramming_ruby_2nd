# What Happens When You Call a Method?
## Method Lookup
class MyClass
  def my_method; 'my_method()'; end
end
class MySubClass < MyClass
end
obj = MySubClass.new
p obj.methods false # => []
p obj.class.instance_methods false # => []
p obj.class.superclass.instance_methods false # => [:my_method]
p obj.my_method # => "my_method()"
p MySubClass.ancestors # => [MySubClass, MyClass, Object, Kernel, BasicObject]

## Modules and Lookup
module M1
  def my_method
    'M1#my_method()'
  end
end
class C
  include M1
end
class D < C; end
p D.ancestors # => [D, C, M1, Object, Kernel, BasicObject]
p D.new.my_method # => "M1#my_method()

module M2
  def my_method
    'M2#my_method()'
  end
end
class C2
  prepend M2
end
class D2 < C2; end
p C2.ancestors # => [D2, M2, C2, Object, Kernel, BasicObject]
p D2.new.my_method # => "M2#my_method()"
