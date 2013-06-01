require 'prime'
@limit = 1_000
primes = Prime.each(@limit).to_a
answers = Array.new
size = primes.size
catch(:end) do
primes.each_index do |i|
  (i+1 .. size-1).to_a.reverse.each do |j|
    sum = primes[i..j].inject(:+)
    next if sum > @limit
    if sum.prime?
      p [ primes[i..j].to_s, sum ]
      answers.push(primes[i..j])
      break
    end
  end
end
end

max_prime = 1
max_length = 1
answers.each do |a|
  if a.size > max_length
    max_length = a.size
    max_prime = a.inject(:+)
  end
end
p max_prime
