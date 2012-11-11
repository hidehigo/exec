class MessageFilter
  def initialize(word)
    @word = word
  end
  def detect?(text)
    text.include?(@word)
  end
end
