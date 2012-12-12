class Bowling
  def initialize 
    @score = 0
  end
  attr_reader :score
  def stroke(n)
    @score += n
    return true
  end
end
