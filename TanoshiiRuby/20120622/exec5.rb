#!/usr/bin/ruby

class A
  protected
  def protected_method
    print "protcted A", "\n"
  end
  def private private_method
    print "private A", "\n"
  end
  def protected private_wrapper
    self.private_method
  end
end

class B < A
  public
  def test_protected
    myA = A.new
    myA.protected_method
  end
  def test_private
    myA = A.new
    myA.private_wrapper
  end
end

b = B.new
print b.test_protected
print b.test_private 
