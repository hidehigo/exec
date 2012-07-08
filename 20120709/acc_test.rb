class AccTest
  def pub
    puts "pub is a public method"
  end
  public :pub

  def priv
    puts "priv is a pivate method"
  end
  private :priv
end

acc = AccTest.new
acc.pub
acc.priv

