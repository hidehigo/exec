# encoding: utf-8
# 確率的な検算

times = 0
count = 0

1000000.times do |i|
  times += 1
  array = (1..9).to_a
  array.shuffle!
  #p array
  a = 100 * array.pop + 10 * array.pop + array.pop
  b = 100 * array.pop + 10 * array.pop + array.pop
  #p a,b,a.to_f/b.to_f
  count += 1 if a.to_f/b.to_f < 0.5
end

p "times: " + times.to_s + " count:" + count.to_s
p count.to_f / times.to_f * 100
