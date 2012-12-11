ary = []
10.times do |i|
  #ary.push(i)
  ary << i
end
p ary

#---
ary = []
10.times { |i| ary << i }
puts ary

#---
ary = []
0.upto(10) { |i| ary << i }
p ary

#--- euler prob.1
sum = 0
1.upto(1000){ |i| sum+=i if((i%3).zero? || (i%5).zero?) }
p sum

#--- sort array
a = [2,5,1,4,3]
a.sort!
p a
