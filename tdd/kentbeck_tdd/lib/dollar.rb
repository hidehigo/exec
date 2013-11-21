require 'money'
class Dollar < Money
  def times(multiplier)
    return Dollar.new( @amount * multiplier )
  end
  def currency()
    return "USD"
  end
end
