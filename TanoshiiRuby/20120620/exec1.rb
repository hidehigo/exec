#!/usr/bin/ruby -w

print <<EOF
  This is the first way of creating...
EOF

print <<"EOF"
  hogehoge
EOF

print <<`EOC`
  echo hogehoaaa
EOC

print <<"foo", <<"bar"
  higo
foo
  akihide
bar
