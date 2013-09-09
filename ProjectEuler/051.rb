require 'prime'

@start = Time.now

gen = Prime::EratosthenesGenerator.new
# いくつ(以上)の素数を持つか
@cnt = 8

while prime = gen.next do
  digits = Array.new
  digits = prime.to_s.split('').uniq
  digits.each do |d|
    # おしりの1ケタ目の数字はskip 
    next if d == (prime % 10).to_s
    #p [prime, digits, d ]
    cnt = 0
    d.to_i.upto(9) do |n|
      p_can_str = prime.to_s.gsub(/#{d}/,n.to_s)
      # 頭の桁にゼロが続くときはskip
      next if p_can_str.match(/^0+/)
      p_can = p_can_str.to_i
      #p [" ",p_can,cnt]
      cnt += 1 if p_can.prime?
    end
    #p [prime, cnt] 
    if cnt >= @cnt
      p ["answer:",prime, cnt] 
      p "took " + ((Time.now - @start) * 1000).round.to_s + "ms"
      exit
    end
  end
end

# 要改造点メモ
# 入れ替えたものが一度チェックした数字と同じになるものはチェック不要で飛ばせるのだが、、
# ex) 4119 は4009の中でチェックされている
