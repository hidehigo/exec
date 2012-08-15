start = Time.now
# 約数の数は素因数分解した組み合わせ数
# n = 2^2 * 3^2 * 5^1 * 7*1
#   => (2+1) * (2+1) * (1+1) * (1+1)
now = 0
idx = 1
$loop_cnt = 0

def factorial_hash(num)
  factors = Hash.new(0)
  divisor = 2 # start from 2
  divided = num.to_i
  while ( divisor <= divided ) do
    $loop_cnt += 1
    if (divided % divisor).zero? then
      factors[divisor] += 1
      divided = divided / divisor
      next
    end
    divisor += 1
  end
  return factors
end

loop do 
  now += idx
  hash = factorial_hash(now)
  #p hash
  factors_num = hash.inject(1){|prod, (key, val)| prod *= (val + 1)}
  #p factors_num
  break if factors_num > 500
  idx += 1
end

p now
print "loop_cnt: #{$loop_cnt}\n"
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
