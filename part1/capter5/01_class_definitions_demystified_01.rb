# Inside Class Definitions

class MyClass
  puts 'Hello'
end # => Hello

result = class MyClass
  self
end
puts result # => MyClass

# The current class
def add_method_to_class(a_class)
  a_class.class_eval do
    def l
      "Hello!"
    end
  end
end

def add_method_to_instance(a_class)
  a_class.instance_eval do
    def m
      "Hello!"
    end
  end
end

add_method_to_class String
puts String.method_defined? :l #=> true
puts String.respond_to? :l #=> false

add_method_to_instance String
puts String.method_defined? :m #=> false
puts String.respond_to? :m #=> true

a = "ABC"
puts a.respond_to? :m #=> false
add_method_to_instance a
puts a.respond_to? :m #=> true
b = "ABC"
puts b.respond_to? :m #=> false
