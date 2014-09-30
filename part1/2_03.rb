def replace(array, original, replacement)
  array.map{|e| e == original ? replacement : e}
end

require 'test/unit'

class ReplacementTest < Test::Unit::TestCase
  def test_replacement
    original = ['one', 'two', 'one', 'three']
    replaced = replace(original, 'one', 'zero')
    assert_equal ['zero', 'two', 'zero', 'three'], replaced
  end
end

class Array
  def replace(original, replacement)
    self.map{ |e| e == original ? replacement : e}
  end
end

class ArrayReplacementTest < Test::Unit::TestCase
  def test_replacement
    original = ['one', 'two', 'one', 'three']
    replaced = original.replace('one', 'zero')
    assert_equal ['zero', 'two', 'zero', 'three'], replaced
  end
end

