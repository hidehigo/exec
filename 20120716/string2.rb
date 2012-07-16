# encoding: utf-8
str = "hoge:hige:age:sage  :ohoho"
column = str.split(/:/)
p column

column2 = str.unpack("a5a5a5a5*")
p column2

