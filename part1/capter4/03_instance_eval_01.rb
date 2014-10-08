# instance_eval
class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new
obj.instance_eval do
  puts self
  puts @v
end
v = 2
obj.instance_eval{@v = v}
obj.instance_eval{puts @v}

#instance_exec
class C
  def initialize
    @x = 1
  end
end
class D
  def twisted_method1
    @y = 2
    C.new.instance_eval{ "@x: #{@x}, @y: #{@y}" }
  end
  def twisted_method2
    @y = 2
    C.new.instance_exec(@y) {|y| "@x: #{@x}, @y: #{y}" }
  end
end
puts D.new.twisted_method1
puts D.new.twisted_method2

# Proc object
inc = Proc.new{|x| x + 1}
puts inc.call(2)
dec = -> (x) { x - 1 }
puts dec.call(2)
puts inc.class, inc.lambda?
puts dec.class, dec.lambda?

def math(a, b)
  yield a, b
end
def do_math(a, b, &operation)
  math(a, b, &operation)
end
puts do_math(2, 3){|x, y| x * y}
puts math(2, 3){|x, y| x * y}

my_proc = proc{"Bill"}
puts my_proc.call()
