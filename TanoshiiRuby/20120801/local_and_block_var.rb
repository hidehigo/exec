x=1 # 1.9ではこれをコメントアウトするとエラー。1.8と1.9で挙動が違う。
ary = [1, 2, 3]

ary.each do |x|
  #hogehoge
end

p x
