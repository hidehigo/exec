data = <<-"EOD"
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
EOD
@ary = data.split(/\n/).map{|l| l.split(/\s/).map{|n| n.to_i}}
@selected = Array.new

def choose()
  @selected << @ary.shift[0]
  # 左を選択するときの残りの選択しうる山
  l_mnt = Marshal.load(Marshal.dump(@ary))
  # 左を選択した時に選べなくなるもの
  l_rest= Array.new
  l_max = l_mnt.inject(0){|s,l| l_rest << l.pop; s += l.max }
  l_rest_sum = l_rest.inject(0){|s,n| s += n }

  # 右を選択するときの残りの選択しうる山
  r_mnt = Marshal.load(Marshal.dump(@ary))
  # 右を選択した時に選べなくなるもの
  r_rest= Array.new
  r_max = r_mnt.inject(0){|s,l| r_rest << l.shift; s += l.max }
  r_rest_sum = r_rest.inject(0){|s,n| s += n }

  if ! l_mnt.empty? && l_max == r_max then p l_mnt,r_mnt; exit end
  #@ary = l_max - l_rest_sum > r_max - r_rest_sum ? l_mnt : r_mnt
  @ary = l_max > r_max ? l_mnt : r_mnt
end

15.times.each do
  choose()
  #@ary.each{|l|p l}
end
p @selected.inject(0){|s,n| s += n}
p @selected
