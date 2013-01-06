# encoding: utf-8

class Pandigital
  @digit = Array.new
  @pans  = Array.new
  def initialize(digit)
    @digit = (1..digit).to_a.reverse
    @pans = @digit.permutation(digit).collect{|ary| ary.join.to_i}.sort.reverse
  end
  def check?(n)
    n.to_s.split('').uniq.size == @digit.size ? true : false
  end
  def include?(n)
    @pans.index(n) ? true : false
  end  
  def get_next_biggest(n)
    idx = 0
    loop do
      pan = @pans[idx] || break
      return pan if pan < n
      idx += 1
    end
    return false
  end  
end

# さて、9ケタpandigitalの各桁の数値の合計は(1 + .. + 9 = 45)なので3で割り切れるので素数ではありえない。8ケタも同様

require 'mathn'
@pan = Pandigital.new(7)
@before = 1_000_000_000
loop do
  @before = @pan.get_next_biggest(@before)
  #p @before
  if @before.prime?
    p @before
    break
  end
end
