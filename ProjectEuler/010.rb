start = Time.now

ary = Array.new(2_000_000){ 1 }
ary[0] = ary[1] = nil
primes = Array.new
idx = 2 # start from 2

loop_cnt = 0
while idx <= ary.size do
  unless ary[idx] == nil then
      primes << idx
      for n in (idx .. ( ary.size / idx ).to_i ) do
        loop_cnt += 1
        ary[idx * n] = nil
      end
  end
  idx += 1
#  p idx
end
p primes.inject(0){|s, i| s += i}
print "loop_cnt: #{loop_cnt}\n"
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
