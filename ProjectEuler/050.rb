require 'prime'
start = Time.now

@limit = 1_000_000
primes = Prime.each(@limit).to_a
answers = Array.new
size = primes.size
tmp_max = 0
#catch(:end) do
primes.each_index do |i|
  tmp_sum = primes[i..-1].inject(:+)
  for j in (1 .. size-i)
    #p [i, j, primes[i..-j]]
    break if (size - i - j) < tmp_max #tmp_maxより短くなったら調べない
    tmp_sum -= primes[-j]
    next if tmp_sum > @limit
    if tmp_sum.prime?
      tmp_max = size - i - j
      #p [ primes[i..-(j+1)].to_s, tmp_sum, tmp_max ]
      answers.push(primes[i..-(j+1)])
      break
    end
  end
end
#end

#max_prime = 1
#max_length = 1
#answers.each do |a|
#  if a.size > max_length
#    max_length = a.size
#    max_prime = a.inject(:+)
#  end
#end
#p max_prime
p answers[-1].inject(:+)
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"

