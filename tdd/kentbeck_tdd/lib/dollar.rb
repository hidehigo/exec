require 'money'
class Dollar < Money
  def times(multiplier)
    return Dollar.new( @amount * multiplier, @currency )
  end
end
