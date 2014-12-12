# Class Instance Variables

class MyClass
  @my_var = 1
  def self.read; @my_var; end
  def write; @my_var = 2; end
  def read; @my_var; end
end
obj = MyClass.new
p obj.read #=> nil
obj.write
p obj.read #=> 2
p MyClass.read #=> 1

# Class Variables
class C
  @@v = 1
end

class D < C
  def my_method; @@v; end
end
p D.new.my_method #=> 1

@@v = 1
class MyClass
  @@v = 2
end
p @@v #=> 2

# Working on Bookworm Again
class Loan
  def initialize(book)
    @book = book
    @time = Loan.time_class.now
  end

  def self.time_class
    @time_class || Time
  end

  def to_s
    "#{@book.upcase} loaned on #{@time}"
  end
end

class FakeTime
  def self.now; "Mon Apr 06 12:15:50"; end
end

require 'test/unit'

class TestLoan < Test::Unit::TestCase
  def test_conversion_to_string
    Loan.instance_eval {@time_class = FakeTime}
    loan = Loan.new 'War and Peace'
    assert_equal 'WAR AND PEACE loaned on Mon Apr 06 12:15:50', loan.to_s
  end
end
