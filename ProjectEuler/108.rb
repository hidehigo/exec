# x + y = x * y /n
# n は x * y の因数

# nを元に、x , yを決める
# x >= y とする

answer = Array.new

n = 4
loop do
x = n + 1
answer = []
loop do 
  flag = false
  #break if ( x + 1 )* n < x
  yy = 1
  (1 .. x).each do |y|
    #p [n,x,y]
    next unless x % n == 0 || y % n == 0
    break if ( n * (x + y) < x * y )
    yy = y
    #p [n,x,y]
    #p ["x + y", 4 * (x +y)]
    #p ["x * y", x *y]
    answer.push([n,x,y]) if x + y == (x * y) / n
    #p answer if x + y == (x * y) / n
  end
  break if x % n == 0 && yy <= n  
  x += 1
end
p answer.size
p answer
n += 1
end












