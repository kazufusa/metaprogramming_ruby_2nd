class Lawyer; end
nick = Lawyer.new
# nick.talk_simple  # => undefined method 'talk_simple' (NoMethodError)
# nick.send :method_missing, :my_method # => undefined method 'my_method' (NoMethodError)

# Overridding method_missing
class Lawyer
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

nick = Lawyer.new
nick.talk_simple('a', 'b') do
  # a block
end # =>
# You called: talk_simple(a, b)
# (You also passed it a block)

# Ghost Methods
## The Hashie Example
require 'hashie'
module Hashie 
  class Mash < Hashie::Hash
    def method_missing(method_name, *args, &blk)
      return self.[](method_name, &blk) if key? method_name
      matches = method_name.to_s.match(/(.*?)([?=!]?)$/)
      case matches[2]
      when "="
        self[matches[1]] = args.first
      else
        default(method_name, *args, &blk)
      end
    end
  end
end
obj = Hashie::Mash.new
p obj.a # => nil
obj.a = 1
p obj.a # => 1
obj[:a] = 2
p obj.a # => 2
