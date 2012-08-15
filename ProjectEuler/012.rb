start = Time.now
# 約数の数は素因数分解した組み合わせ数
# n = 2^2 * 3^2 * 5^1 * 7*1
#   => (2+1) * (2+1) * (1+1) * (1+1)
now = 0
idx = 1
$loop_cnt = 0

## 素数の候補を返す。30で割った余りが以下のものが素数の候補
@pc = [1, 7, 11, 13, 17, 19, 23, 29]
def next_prime_candidate(now)
  divmod = now.divmod(30)
  if ( idx = @pc.index(divmod[1]) + 1 ) == @pc.size 
    then return 30 * ( divmod[0] + 1) + @pc[0]
    else return 30 * divmod[0] + @pc[idx]
  end
  30 * divmod[0] + @pc[ @pc.index(divmod[1]) ]
end
## 素因数分解したhashを返す
def factorial_hash(num)
  factors = Hash.new(0)
  # 小さい素数は予め与えておく。それ以上はnext_prime_candidate
  divisor_pre = [ 2, 3, 5, 7 ]
  divisor = divisor_pre.shift # start from 2
  divided = num.to_i
  while ( divisor <= divided ) do
    $loop_cnt += 1
    if (divided % divisor).zero? then
      factors[divisor] += 1
      divided = divided / divisor
      next
    end
    divisor = divisor_pre.empty? \
            ? next_prime_candidate(divisor) \
            : divisor_pre.shift
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
