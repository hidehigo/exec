start = Time.now

now = 0
idx = 1
$loop_cnt = 0

def factorize(n)
  i = 1
  ary = []
  while n.to_f/i >= 2
    ary << i if (n%i).zero?
    i += 1
    $loop_cnt += 1
  end
  ary << n
  return ary
end

loop do 
  now += idx
  p ( a = factorize(now))
  break if a.size > 500
  idx += 1
end

p now
print "loop_cnt: #{$loop_cnt}\n"
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
