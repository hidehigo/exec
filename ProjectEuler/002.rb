ary = [1,2]
nex = ary[-1] + ary[-2]
while nex <= 4000000; ary << nex; nex = ary[-1] + ary[-2]; end
p ary.inject(0){|sum, i| (i%2).zero? ? sum + i : sum}
