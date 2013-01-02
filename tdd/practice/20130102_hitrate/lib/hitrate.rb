class Rate
  def initialize(daseki, dasuu, anda)
    @daseki = daseki
    @dasuu  = dasuu
    @anda   = anda
  end
  def calc
    return nil if @daseki == 0
    return 0 if @dasuu == 0
    return @anda / @dasuu.to_f 
  end
  def rate
    rate = self.calc
    return nil if rate == nil
    return "0.000" if rate == 0
    return "%.3f" % rate
  end
  def format_rate
    rate = self.calc
    return "----" if rate == nil
    return ".000" if rate == 0
    return "1.00" if rate == 1
    return ("%.3f" % rate ).gsub(/^\d(.*$)/,'\1')
  end
end
