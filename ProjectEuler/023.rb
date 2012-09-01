def ary_divisor(num)
  factors = Array.new(0)
  divisor = 2 # start from 2
  divided = num
  while ( divisor ** 2 <= divided ) do
    if (divided % divisor).zero? then
      factors << divisor
      divided = divided / divisor
      next
    end
    divisor += 1
  end
  factors << divided
  r_divisor([], factors)
end

def r_divisor(list, rest)
  return list.uniq if rest.empty?
  now = rest.shift
  new_list = Array.new
  if list.empty?
    new_list << now ** 0
    new_list << now ** 1
  else
    list.each do |n|
      new_list << n * now ** 0
      new_list << n * now ** 1
    end
  end
  r_divisor(new_list, rest)
end

def d(num)
  ary = ary_divisor(num)
  return ary.inject(&:+) - ary.max
end

@over = Array.new
(1..28123).each do |n|
  if d(n) > n
    @over << n
  end
end

p "here1"
# sum_overは過剰数の和で表せるもの
sum_over = Hash.new(nil)
@over.combination(2){|a| sum_over[a[0] + a[1]] = 1}
# combinationでは同じ数同士の和が考慮されないので
@over.each{|n|sum_over[n * 2] = 1 if n < 28123}

p "here2"
@req = Array.new
(1..28123).each{|n| @req << n if sum_over[n].nil?}

p @req if $DEBUG
p @req.inject(&:+)

# 以下は、過剰数を求める別解(途中)
#check = Hash.new(nil)
#(1..28123).each do |n|
#  next if check[n] == 1
#  if ( d = d(n) ) >= n
#    # 過剰数,完全数の倍数は過剰数
#    tmp_n = n
#    tmp_pro = 1
#    while ( tmp_n = n * tmp_pro ) < 23123
#      @over << tmp_n if ! ( tmp_pro == 1 && d == n ) # 完全数自身は過剰数ではない
#      check[tmp_n] = 1
#      tmp_pro += 1
#    end
#  end
#end

