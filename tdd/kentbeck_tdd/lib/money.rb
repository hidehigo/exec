autoload :Dollar, 'dollar'
autoload :Franc, 'franc'
class Money
  attr_reader :amount, :currency
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end
  def ==(money)
    return @amount == money.amount && @currency == money.currency
  end
  def times(multiplier)
    return Money.new( @amount * multiplier, @currency )
  end
  def self.dollar(amount)
    return Money.new(amount, "USD")
  end
  def self.franc(amount)
    return Money.new(amount, "CHF")
  end
end
