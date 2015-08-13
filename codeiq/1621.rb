# https://codeiq.jp/challenge/1621
# 与えられた数字よりも小さい数字の中で、
# 素数がいくつあるかを調べるプログラムを作ってください。

#start = Time.now
# 与えられた数字の長さの配列を作って、素数じゃないidxをnilにしていくアプローチ
10.times do 
s = STDIN.gets.to_i
ary = Array.new(s){ 1 }
ary[0] = ary[1] = nil
primes = Array.new
idx = 2 # start from 2

#loop_cnt = 0
while idx <= ary.size do
  # すでにnilになっているidxは素数じゃない
  unless ary[idx] == nil then
      primes << idx
      # 素数に遭遇したらそのn倍をnilにする
      # ちなみに idx * 2, idx * 3 ... はすでに落とされているので
      # loopの開始は、idx * idx からでよい
      for n in (idx .. ( ary.size / idx ).to_i ) do
        #loop_cnt += 1
        ary[idx * n] = nil
      end
  end
  idx += 1
#  p idx
end
p ary.compact.size
end
#print "loop_cnt: #{loop_cnt}\n"
#print "took " + ((Time.now - start) * 1000).round.to_s + "ms.\n"
