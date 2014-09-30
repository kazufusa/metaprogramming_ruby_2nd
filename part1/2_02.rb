require "money"

bargain_price = Money.from_numeric(99, "USD")
bargain_price.format # => "$99.00"

standard_price = 100.to_money("USD")
standard_price.format # => "$100.00"
