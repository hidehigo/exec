
ary = Array.new
cnt = 0
10000.times do |i|
  cnt += 1
  begin
    #ary << File.open("../README", "r")
    ary << File.open("../README", "r+")
  rescue => e
    p cnt
    p e
    exit
  end
end

