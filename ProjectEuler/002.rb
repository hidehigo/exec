first,second = [ 1, 2 ]
max = 4.0e6.to_i
fibo = Array.new
fibo << first
fibo << second
loop do 
  next_elem = fibo[-1] + fibo[-2]
  break if next_elem > max
  fibo << next_elem
end
p fibo
p fibo.inject(0){|sum, elem| (elem%2).zero? ? sum + elem : sum}
