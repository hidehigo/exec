class Registers
  attr_reader :registers
  alias :waiting :registers
  def initialize()
    @registers = Array.new(5,0)
    @transaction = [ 2,7,3,5,2 ]
  end
  def visit(num)
    min_i = @registers.index(@registers.sort.first)
    @registers[min_i] += num 
  end
  def transact
    @registers.each_index do |idx|
      @registers[idx] -= @transaction[idx]
    end
  end
end
