# encoding: utf-8
# encoding指定したら、文字数で出るよう。>= ruby1.9 
p 'ほげほげ'.length

p 'ほげほげ'.split(//u).length
# ↓文字コードが合ってなかったらエラー
#p 'ほげほげ'.split(//s).length
