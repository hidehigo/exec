start = Time.now
@a = [nil, 0]

def calc(n) 
  return @a[n] if ! @a[n].nil?
  m = n.even? ? n/2 : 3 * n + 1
  if ! @a[m].nil?
    @a[n] = @a[m] + 1
  else
    @a[n] = calc(m) + 1
  end
  # nになる数も埋めておく
  if n.even?
    if @a[ o = 2*n ].nil? then @a[o] = @a[n] + 1 end
  else
    if ( (n-1) % 3 ) == 0 && @a[ o = (n-1)/3 ].nil? then @a[o] = @a[n] + 1 end
  end
  return @a[n]
end

(1..100).each{|n|
  if @a[n] 
    #puts "exists:#{n}"
    next
  else
    #puts "calc:#{n}"
    calc(n)
    #print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
  end
}

puts "max_index: " + @a.size.to_s
puts "max_step: " + step = @a.inject(0){|max,n| if n.nil? then max else max < n ? n : max end}.to_s
puts "num of not nil: " + @a.select{|n| !n.nil? }.size.to_s
puts "max_at: " + @a.index(step.to_i).to_s
#@a.each_index{|n| print "#{n}:#{@a[n]} "}
