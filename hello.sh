printf "\ec\e[44;37m\n"
awk 'BEGIN {for (i=1; i<=100; i++) print "hello" i "world" i}' 
