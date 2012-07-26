
first = 1
second = 2
finish = 4000000

fibo = Array.new
fibo << first
fibo << second

sum_even = 0

loop do
  break if fibo[-1] + fibo[-2] > finish
  fibo.push (fibo[-1] + fibo[-2])
  sum_even += fibo[-1] if (fibo[-1] % 2).zero?
end

p fibo
p sum_even + 2
#p fibo.inject(0){ |sum, elem| sum + elem if (elem % 2).zero? }
