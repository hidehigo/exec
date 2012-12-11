class Pandigital
  def pan?(n)
    ary = n.to_s.split('')
    return false if ary.size != 9
    return ary.size == ary.uniq.size ? true : false
  end
  def length_over?(n)
    return n >= 1_000_000_000 ? true : false
  end
  def get_multiplyer(n)
    multiplyer = [1]
    m = 2
    loop do
      multiplyer << m
      pan_cand = String.new
      multiplyer.each do |i|
        pan_cand << (i * n).to_s
        #p multiplyer
        #p pan_cand
      end
      if length_over?(pan_cand.to_i) 
        return []
      else
        return multiplyer if pan?(pan_cand.to_i)
        m += 1
      end
    end
    #return [1,2,3]
  end
end
