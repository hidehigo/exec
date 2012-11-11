class MessageFilter
  def initialize(*words)
    @ng_words = words
  end
  attr_reader :ng_words

  def detect?(text)
    @ng_words.any?{|w| text.include?(w)}
  end
end
