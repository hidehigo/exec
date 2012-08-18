# encoding: utf-8
start = Time.now
# ロジックを再考する。
# 1
# 2
# 4
# 8
# 16*  <- 5  10*     20      40*
# 32          \ 3  6 12 24..  \ 13 26 52* 104..
# 64*  <- 21  42  84..                 \ 17 34* 68..
# 128                                        \ 11
# 
# starのついた数字の時に分岐(＆数が戻る)
# これを経ないルートはただ2の累乗をかけていくだけなのですぐに100万超える
#
# starのついた数字は、偶数であって、かつ(3n+1)で表される
# nが偶数だと、3n+1が奇数になって条件を満たさないので
# nは奇数。かつn>1(これなぜかはもうちょい考えないと分からん)
# と考えると、3n+1(nは奇数) === 6m+4(mは自然数)

@a = Hash.new(0)
@a[1] = 1

def calc(n) 
  return @a[n] if @a[n] != 0
  m = n.even? ? n/2 : 3 * n + 1
  if @a[m] != 0
    @a[n] = @a[m] + 1
  else
    @a[n] = calc(m) + 1
  end
  # nになる数も埋めておく
  if n.even?
    if @a[ o = 2*n ] == 0 then @a[o] = @a[n] + 1 end
  else
    if ( (n-1) % 3 ) == 0 && @a[ o = (n-1)/3 ] == 0 then @a[o] = @a[n] + 1 end
  end
  return @a[n]
end

# starつきの数字だけ調べる。最大は3n+1が100万を超えない範囲
# === 6m + 4 が200万を超えない範囲
# ここまでは合っているはずなのだが、、、
# こののちまた100万以下に戻ってくるよう。。終了条件が分からん。。お手上げ
# というわけで出力される数字は不正解ｗ
# higo.rbは正解を出せるのだが、遅すぎるのでコミットしない
(1..333_332).each{|m|
  n = 6*m +4
  if @a[n] != 0 
    #puts "exists:#{n}"
    next
  else
    #puts "calc:#{n}"
    calc(n)
    #print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
  end
}

# 100万未満のstepの最大値
max_index  = 0
(1..1_000_000).each{|n| max_index = n if @a[n] > @a[max_index] }
p max_index
puts "max_index(under 1m): " + max_index.to_s + " 長さ: " + @a[max_index].to_s

# 数列の出力用
def printn(n)
  return if n == 1
  p n
  m = n.even? ? n/2 : 3 * n + 1
  printn(m)
end
#print(max_index)

# 以下は@a全体
#puts "max_index: " + @a.inject(0){|max,(k,v)| max < k ? k : max }.to_s
#puts "max_step: " + step = @a.inject(0){|max,(k,v)| max < v ? v : max }.to_s
#puts "num of not nil: " + @a.size.to_s
#puts "max_at: " + @a.key(step.to_i).to_s
print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
#@a.each{|k,v| print "#{k}:#{v} "}
