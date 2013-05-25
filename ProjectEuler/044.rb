class Euler044
  def initialize
    @penta = Array.new
    @penta.push(0,1)
  end
  attr_reader :penta
  def expand_penta(n)
    # nまでpentaが用意されてない場合は拡張
    i = @penta.length
    while ( @penta[i-1] < n ) do
      @penta.push(i * (3*i-1) / 2)
      #p @penta
      i += 1
    end
    return @penta[-1]
  end
  def add_penta(i)
    # i-th までpentaが用意されてない場合は拡張
    last = @penta.length
    (last .. i).each do |j|
      @penta.push(j * (3*j-1) / 2)
#p @penta
    end
    return @penta[i]
  end
  def is_penta?(n)
    self.expand_penta(n)
    return @penta.index(n)
  end
end

i = 2
@eu = Euler044.new
catch(:end) do
loop do
#p i
  @eu.add_penta(i) if @eu.penta[i].nil?
  (2 .. i-1).to_a.reverse.each do |j|
    pk = @eu.penta[i]
    pj = @eu.penta[j]
    #p [pk, pj] 
    sum = pj + pk
    diff = pk - pj
    #p [@eu.is_penta?(sum), @eu.is_penta?(diff)]
    if ( @eu.is_penta?(sum) )
      #p "sum:" + sum.to_s
      if ( @eu.is_penta?(diff) )
        p "diff:" + diff.to_s
        throw :end
      end
    end
  end
  i += 1
end
end
