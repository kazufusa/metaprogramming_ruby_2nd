# Proc, lambda, and return
def an_double()
  l = ->{return 10}
  result = l.call
  return result * 2
end
p an_double() #=> 20

def another_double()
  p = Proc.new {return 10}
  result = p.call
  return result * 2
end
p another_double() #=> 10

def double(callable_object)
  callable_object.call * 2
end
l = ->{return 10}
p = Proc.new{return 10}
p double(l) #=> 20
# p double(p) #=> LocalJumpError
p = Proc.new{10}
p double(p) #=> 20

# Proc, lambda, and arity
p = Proc.new {|a, b| [a, b]}
p p.arity #=> 2
p p.call(2, 3) #=> [2, 3]
p p.call(1) #=> [1, nil]
l = -> (a, b){[a, b]}
p l.arity #=> 2
# p l.call(2) #=> ArgumentError
