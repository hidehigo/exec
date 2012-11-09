class MessageFilter
  def initialize(word)
    @word = word
  end
  def detect?(text)
    return true
  end
end
