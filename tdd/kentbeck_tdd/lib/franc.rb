require 'money'
class Franc < Money
  def initialize(amount)
    super
    @currency = "CHF"
  end
  def times(multiplier)
    return Money.franc( @amount * multiplier )
  end
end
