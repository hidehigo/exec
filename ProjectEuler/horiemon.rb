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
rest=[1,1,1,1,1,1,1,1,1,1,1,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,5,5,5,5,5,5,5,5,5,5,5]
rsum = rest.inject(&:+)
rest.sort!.reverse!

def f(n, rest, rsum, used=[])
	#p [n, rest, rsum, used]

	if @cache.has_key?([n,used])
		return
	end

	return if n > rsum   # 残り全部足しても足りない
	return if n < 0
	if n == rsum         # 残り全部足してちょうど
		@found[ [used,rest].flatten ] = 1
	  return
	end
	if ( n == 0 ) then   # 今のでちょうど
		@found[ used ] = 1
		return
	end

	f(n, rest[1 .. -1], rsum - rest[0], used)
	f(n - rest[0], rest[1 .. -1], rsum - rest[0], [used, rest[0]].flatten)
	@cache[ [n,used] ] = 1
	return
end

f(10, rest, rsum)
p @found.size 
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"

