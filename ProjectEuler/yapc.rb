#/usr/bin/ruby
start = Time.now
@primes = [2, 3, 5, 7]
@loop_cnt = 0
@loop_cnt2 = 0
@loop_cnt3 = 0
@sum = @primes.inject(:+)

## 素数の候補を返す。30(2*3*5)で割った余りが以下のものが素数の候補
@pc = [1, 7, 11, 13, 17, 19, 23, 29, \
       31] #←繰り上がり対応用
def next_prime_candidate(now)
  mod = now % 30
  return now - mod + @pc[ @pc.index(mod) + 1 ]
end

def prime?(n)
  @primes.each do |prime|
    @loop_cnt += 1
    break if prime ** 2 > n
    return false if n % prime  == 0
  end
  (@primes[-1] .. n ).each do |m|
    @loop_cnt2 += 1
    return true if m ** 2 > n
    return false if n % m == 0
  end
  return false
end

n = 8
while @primes.size < 10000
  @loop_cnt3 += 1
  if prime?(n)
    @primes << n
    @sum += n
    n = next_prime_candidate(n)
    #n += 1
    next
  end
  n += 1
end

#p @primes[-1]
p @sum
#print "loop_cnt: #{@loop_cnt}\n"
#print "loop_cnt: #{@loop_cnt2}\n"
#print "loop_cnt: #{@loop_cnt3}\n"
#print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
