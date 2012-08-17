start = Time.now
@a = [nil, 0]

def calc(n) 
  return @a[n] if ! @a[n].nil?
  m = n.even? ? n/2 : 3 * n + 1
  if ! @a[m].nil?
    @a[n] = @a[m] + 1
    return @a[n]
  end
  return @a[n] = calc(m) + 1
end

(1..999_999).each{|n|
  if @a[n] 
    #puts "exists:#{n}"
    next
  else
    puts "calc:#{n}"
    calc(n)
    print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
  end
}

puts "max_index: " + @a.size.to_s
puts "max_value: " + @a.inject(0){|max,n| if n.nil? then max else max < n ? n : max end}.to_s
puts "num of not nil: " + @a.select{|n| !n.nil? }.size.to_s
#@a.each_index{|n| print "#{n}:#{@a[n]} "}
