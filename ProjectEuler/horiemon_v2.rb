# https://codeiq.jp//challenge/1618 
# こんにちは。堀江貴文です。
# 【3つの棒をつなぎ合わせる組み合わせを数えてください】
# 長さの異なった棒がいくつかあります。
# たとえば、次のように長さが8, 4, 10, 3, 2の5種類の棒
# があるとすると、これらの中から3つ選んでつなぎ合わせ、長さがちょうど15になる棒の長さの組み合わせは(8, 4, 3)と(10, 3, 2)の2通りあります。
# つなぎ合わせる際の、棒の順番は考慮しません。つまり、(8, 4, 3), (8, 3, 4), (4, 8, 3), ...のような選び方は、すべて同じ組み合わせと考えます。また、つなぎ合わせる棒は必ず3本で、1本・2本だけで目的の長さになっていたとしても、それは組み合わせに含みません。
# 【問題】
#  つなぎ合わせたときの長さLと、N個(1≦N≦5000)の棒の長さが標準入力から与えられるとき、N個の棒の中から3つをつなぎ合わせて長さがLになる組み合わせの総数を求めるプログラムを書いてください。ただし、個々の棒の長さや、つなぎ合わせた長さ(L)は正の整数で、32bit整数で十分扱える範囲です。また、棒の長さはすべて異なるものとします。

start = Time.now
@cache = Hash.new
@found = Hash.new 

# 入力を受ける
S = STDIN.gets.to_i
num = STDIN.gets.to_i
f = Array.new
num.times{ f.push(STDIN.gets.to_i) }
f.sort!.reverse!

# l > m > n
# fl >= fm >= fn
# fl + fm + fn = S

l = 0
while ( f[l] * 3 >= S ) do
	#p l
	m = l + 1
	while ( f[m] * 2 >= S - f[l] ) do
		if ( f[l] + f[m] + f[-1] <= S ) then
			ff = f.slice(m+1 .. -1)
			if (ff.index(S-f[l]-f[m])) then
			 	@found[ [f[l],f[m]] ] = 1	
			end
		end
		m += 1
	end
  l += 1
end
#p @found.keys
p @found.keys.length

print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"

