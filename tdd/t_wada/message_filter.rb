class MessageFilter
  def initialize(*words)
    @words = words
  end
  def detect?(text)
    @words.any?{|w| text.include?(w)}
  end
end
