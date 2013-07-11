

@p = Array.new

@p[1] = []
@p[2] = ["1,1"]
@p[3] = ["2,1","1,1,1"]
@p[4] = ["1,1,1,1", "1,1,2", "1,3"]

#@p[4] = [[1,3],[1,1,2],[1,1,1,1],[2,2]]
#@p[5] = [[1,4],[1,1,3],[1,1,1,2],[1,1,1,1,1],[2,3],[2,1,2],[2,1,1,1],[3,2],[3,1,1][4,1]]

def calc(n)
  cand = Array.new
  # p[n-1]はある前提
  (1..n-1).each do |m|
    # p[n-1]に"n-1"自身を加えて回さないといけない
    [@p[n-m], (n-m).to_s].flatten.each do |str|
      #p [m, str]
      cand.push( (m.to_s + "," + str).split(',').sort.join(",") )
      #cand.push((m.to_s + str).split(',').to_a)
    end
  end
  #p cand
  #p cand.uniq
  p n
  @p[n] = cand.uniq
end

(5..100).each do |a|
  calc(a)
end

p @p[100].size

