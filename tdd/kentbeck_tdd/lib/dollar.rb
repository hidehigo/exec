require 'money'
class Dollar < Money
  def times(multiplier)
    return Dollar.new( @amount * multiplier )
  end
  def equals?(dollar)
    return true if @amount == dollar.amount
  end
end
