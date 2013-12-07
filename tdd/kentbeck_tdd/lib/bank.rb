require 'pair'
class Bank
  def initialize
    @rates = Hash.new
  end
  def reduce( source, to )
    return source.reduce(self, to)
  end
  def add_rate( from, to, rate )
    @rates.store(Pair.new(from, to), rate)
  end
  def rate(from, to)
    return 1 if from == to
    p Pair.new(from, to)
    p @rates[Pair.new(from, to)]
    return @rates[Pair.new(from, to)]
    return ( from == "CHF" && to == "USD" ) ? 2 : 1
  end
end
