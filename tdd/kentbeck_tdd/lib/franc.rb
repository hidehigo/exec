require 'money'
class Franc < Money
  def times(multiplier)
    return Franc.new( @amount * multiplier, @currency )
  end
end
