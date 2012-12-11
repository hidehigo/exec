h1 = Hash.new
h2 = Hash.new("")
p h1[:not_exist]
p h2[:not_exist]

h3 = {"key" => "hoge", :key => "hage"}
p h3["key"]
p h3[:key]

h4 = {key: "hoge"}
# h4 = {key : "hoge"} <=error
p h4["key"]
p h4[:key]
