require 'money'
class Dollar < Money
  def initialize(amount)
    super
    @currency = "USD"
  end
  def times(multiplier)
    return Money.dollar( @amount * multiplier )
  end
end
