require 'money'
class Franc < Money
  def times(multiplier)
    return Franc.new( @amount * multiplier )
  end
  def currency()
    return "CHF"
  end
end
