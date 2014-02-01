class Registers
  attr_reader :registers
  #alias :waiting :registers
  def initialize()
    @registers = Array.new(5,[])
    @transaction = [ 2,7,3,5,2 ]
  end
  def visit(num)
    @waiting = self.waiting()
    min_i = @waiting.index(@waiting.sort.first)
    @registers[min_i] += Array.new(num,1) 
  end
  def transact
    @registers.each_index do |idx|
      @transaction[idx].times { @registers[idx].shift }
    end
  end
  def waiting
    tmp = Array.new
    @registers.each{|a| tmp.push(a == nil ? 0 : a.size)}
    return tmp
  end
end
