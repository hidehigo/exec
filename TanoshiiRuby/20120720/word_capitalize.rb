
def word_capitalize(str)
  capitalized = ""
  str.scan(/(.)(.*?)(\-|$)/) do |first, rest, delimiter|
    capitalized += first.upcase + rest.downcase + delimiter
  end
  return capitalized
end

# 正解
# capitalizeというstrのmethodがある！
# -でsplitするというアプローチ
# -はエスケープしなくてもよいよう
#def word_capitalize(str)
#  return str.split(/\-/).collect{|block| block.capitalize}.join('-')
#end

p word_capitalize("in-reply-to")
p word_capitalize("X-MAILER")
# でも、正解だと、以下のケースは最後の-なくなっちゃうもんねーｗ オレの勝ちｗ
p word_capitalize("in-reply-to-")
