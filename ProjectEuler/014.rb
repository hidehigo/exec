start = Time.now
@a = [nil, 0]

def calc(n) 
  return @a[n] if ! @a[n].nil?
  if n.even?
    m = n/2
    if ! @a[m].nil?
      @a[n] = @a[m] + 1
      return @a[n]
    end
    return @a[n] = calc(m) + 1
  else
    m = 3 * n + 1
    if @a[m].nil?
      @a[n] = calc(m) + 1
    end
    return @a[n] = calc(m) + 1
  end
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

#@a.each_index{|n| print "#{n}:#{@a[n]} "}
