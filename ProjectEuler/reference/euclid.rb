# encoding: utf-8
# ユークリッドの互除法
# http://tokyo-ct.net/usr/kosaka/for_students/jissen1/akiyojissen1/kougi1.html
# 最大公約数 (Greatest Common Divisor)
# euclid_gcd(12707,12319)=97 

def eucild_gcd(p1, p2)
  loop do
    break if ( r = p1 % p2 ) == 0
    p1 = p2
    p2 = r
  end
  return p2
end

p eucild_gcd(12707,12319)
p eucild_gcd(12319,12707)
