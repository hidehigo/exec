# コンセプト
# @selected が辿る数字のpositionの列
# 1行ずつ足しながら
# 大きい方の数字をたどる
# 足した行の最大値から@selected に合流するところまで遡ったものとの差をみる
# 最大値から遡って辿ったものの方が大きければそちらを新ルートとして@selectedを書き換える

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

# @selected の最後から次の大きい方を選択する
# @selected はary_part より1行短い つまり ary_part は1行ずつ増える想定
def choose(ary_part)
  lsp = @selected[-1] # last_selected_position
  nsp = Array.new     # new_selected_position
  @selected << nsp = ary_part[lsp[0] + 1][lsp[1]] >= ary_part[lsp[0] + 1][lsp[1] + 1] \
    ? [lsp[0] + 1, lsp[1]] \
    : [lsp[0] + 1, lsp[1] + 1]
  puts "new_selected: " + val(nsp).to_s if $DEBUG
end

def val(pos, ary = @ary)
  #puts "val: " + ary[pos[0]][pos[1]].to_s + " pos:" + pos.to_s if $DEBUG
  return ary[pos[0]][pos[1]]
end
def row(pos)
  #puts "row: " + pos[0].to_s if $DEBUG
  return pos[0]
end
def x(pos)
  #puts "x: " + pos[1].to_s if $DEBUG
  return pos[1]
end

# 選び直す必要があるかどうかを判定
# 判定にあたっては、@selectedを逆に辿ったもの(rsp)とmax(n)から大きい方を辿ったもの(mp)とを比べる
# maxは、同じ数字がある場合も考慮
def overwrite_selected(ary_part)
  puts "overwrite_selected(): " + ((ary_part.length) -1).to_s if $DEBUG
  max = ary_part[-1].max
  ary_part[-1].each_with_index do |m, i|
    #next if m != max # maxからのみたどればよい
    #puts m.to_s + ":" + val(@selected[-1]).to_s
    next if m < val(@selected[-1]) # maxからのみたどればよい
    #p ary_part[-1]
    nri = (ary_part.length) -1 # now_row_index
    rsp = [] # reverse_selected_positions
    rsp << @selected[-1]
    mp = [] # max_positions
    mp << [nri, i]
    # mpを辿っていきつつ、rspを追加していく
    go_back = 1
    while (x(rsp[-1]) != x(mp[-1])) do
      rsp << @selected[-1 - go_back]
      if x(mp[-1]) == 0
        mp << [nri - go_back, x(mp[-1])]
      elsif x(mp[-1]) == ( @ary[row(mp[-1])].length ) - 1
        mp << [nri - go_back, x(mp[-1]) -1 ]
      else
        mp <<= val([ row(mp[-1]) -1, x(mp[-1]) -1 ]) >= val([ row(mp[-1]) -1, x(mp[-1]) ]) \
          ? [row(mp[-1]) -1, x(mp[-1]) -1] \
          : [row(mp[-1]) -1, x(mp[-1])   ]
      end
      go_back += 1
    end
    puts "rsp: " + rsp.map{|n|val(n)}.to_s if $DEBUG
    puts "mp: " + mp.map{|n|val(n)}.to_s if $DEBUG
    # mpの合計 > rspの合計なら、@selectedを書き換える
    # 不等号でよい。(どうせ後から上書きされるので)
    if mp.inject(0){|s,n| s += val(n)} > rsp.inject(0){|s,n| s += val(n)} 
      puts "overwrite @selected." if $DEBUG
      puts "@selected before: " + @selected.map{|n|val(n)}.to_s + ":" + @selected.map{|n|val(n)}.inject(0){|s,n|s+=n}.to_s if $DEBUG
      @selected[-(mp.length) .. -1] = mp.reverse
      puts "@selected after : " + @selected.map{|n|val(n)}.to_s + ":" + @selected.map{|n|val(n)}.inject(0){|s,n|s+=n}.to_s if $DEBUG
    end
  end
  return false
end

ary_part = Array.new
@selected << [0,0] # 75
ary_part << @ary[0]
#ary_part << @ary[1]
(1..14).each do |n|
  ary_part << @ary[n]
  choose(ary_part)
  # ここで、行のmaxじゃない時に、どこまで戻るかのロジックが必要
  # ここをブラッシュアップできれば何行でも解ける！
  if @ary[n].max != @ary[@selected[-1][0]][@selected[-1][1]] && diff = overwrite_selected(ary_part)
    puts "diff: " + diff.to_s if $DEBUG
    # とりあえず2行分消して再選択
    @selected.pop
    @selected.pop
    choose(ary_part)
  end
end

p @selected.map{|p| val(p)}
p @selected.map{|p| val(p)}.inject(0){|s,n| s+= n}
#p @selected.inject(0){|s,n| s += n}
#p @selected
