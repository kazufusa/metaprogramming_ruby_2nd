c = Class.new(Array) do
  def my_method
    'Hello!'
  end
end

MyClass = c
p c.name
