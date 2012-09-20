prods = Hash.new

(2..100).each do |a|
  (2..100).each do |b|
    prods[a ** b] = true
  end
end

p prods.keys.size
