def a_method(a, b)
  return 'no block' unless block_given?
  a + yield(a, b)
end
p a_method(1, 2){|x, y| (x + y) * 3} # => 10
p a_method(1, 2) # => "no block"

# Quiz: The using Keyword
class Resource
  attr_accessor :is_disposed
  def initialize
    @is_disposed = false
  end
  def dispose
    @is_disposed = true
    'resource disposed'
  end
end

module Kernel
  def with(resource)
    begin
      yield(resource)
    ensure
      resource.dispose
    end
  end
end

resource = Resource.new
p resource.is_disposed # => false
with(resource){}
p resource.is_disposed # => true
