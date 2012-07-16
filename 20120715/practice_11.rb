#--(1)
a = Array.new
(1..100).each do |i|
  a.push(i)
end
p a

#--(1)'
b = Array.new
(1..100).each{|elem| b << elem}
#p b

#--(1)''
c = (1..100).to_a
p c

#--(2)
a2 = a.collect{|i| i *= 100 }
p a2

a.collect!{|i| i *= 100}
p a
#--(2)'
#a.each_with_index do |elem, i|
#  a[i] = elem * 100
#end
#p a

#--(3)
a = Array.new
(1..100).each{|elem| a << elem}
p a
a3 = Array.new
a.each{|elem| a3 << elem if (elem % 3 == 0)}
p a3
#↓これは変な結果になる。自身のeachの中で消しちゃダメ。
#a.each_with_index do |elem, i|
#print "i:",i," elem:",elem,"\n"
#p a
#  a.delete_at(i) if (elem % 3 != 0)
#p a
#end

#a.delete_if{|elem| elem % 3 != 0}
#--(3)'
a.reject!{|elem| elem % 3 != 0}
p a

#--(4)
a = Array.new
(1..100).each{|elem| a << elem}
count = 0
a.sort! do |item1, item2|
  item2 <=> item1
  count += 2
end
p count
p a

#--(5)
sum = 0
a.each{|item| sum += item}
p sum 

#--(6)
a = Array.new
(1..100).each{|elem| a << elem}
result = Array.new
10.times do |i|
  #result << a.slice(10*i..(10*(i+1)-1))
  result << a[ 10*i .. (10*(i+1)-1) ]
end
p result

def sum_array (array1, array2)
  res_array = Array.new
  array1.zip(array2) do |item1, item2|
    res_array << item1 + item2
  end
  return res_array
end

p sum_array([1,2,3],[4,6,8])
