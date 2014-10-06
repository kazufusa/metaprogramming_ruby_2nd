class MyClass
  def self.define(name)
    p "defining method: #{name}"
    define_method name do
      name.capitalize.to_s
    end
  end

  def define_foo
    MyClass::define :foo
  end

  define_method :bar do
    "Bar"
  end

  define :hello
  define "world"
end

p MyClass.instance_methods false
obj = MyClass.new
p obj.hello
p obj.world
obj.define_foo
p MyClass.instance_methods false
