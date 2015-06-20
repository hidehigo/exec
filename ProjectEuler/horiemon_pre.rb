start = Time.now
@cache = Hash.new

def f(n, currency=[10000,5000,2000,1000,500,100,50,10,5,1])
	currency.sort!.reverse!

	if @cache.has_key?([n,currency.length])
		return @cache[ [n,currency.length] ]
	end

	if currency.length == 1
		@cache[ [n,currency.length] ] = 1
		return 1
	end

	cnt = 0
	for i in (0 .. (n / currency[0] + 1) ) do
		cnt += f(n - i * currency[0], currency[1 .. -1])
	end
	@cache[ [n,currency.length] ] = cnt
	return cnt
end

p f(2000)

print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"

