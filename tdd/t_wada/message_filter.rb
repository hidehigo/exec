class MessageFilter
  def initialize(*words)
    @words = words
  end
  def detect?(text)
    @words.each do |w|
      return true if text.include?(w)
    end
    false
  end
end
