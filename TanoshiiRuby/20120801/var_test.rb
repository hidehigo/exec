
z = 0
y = z
x = y
z = 1
p [x,y,z]

b = [0, 1]
a = b
b.each do |i|
  b[i] += 1
end
p [a, b]


