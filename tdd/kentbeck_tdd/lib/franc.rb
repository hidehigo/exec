require 'money'
class Franc < Money
  def initialize(amount)
    super
    @currency = "CHF"
  end
  def times(multiplier)
    return Franc.new( @amount * multiplier )
  end
end
