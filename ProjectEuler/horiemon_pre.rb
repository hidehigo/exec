def f(n, currency=[10000,5000,2000,1000,500,100,50,10,5,1])
	currency.sort!.reverse!

	if currency.length == 1
		if n % currency[0] == 0
			return 1
		end
		return 0
	end

	cnt = 0
	for i in (0 .. (n / currency[0] + 1) ) do
		cnt += f(n - i * currency[0], currency[1 .. -1])
	end
	return cnt
end

p f(2000)
