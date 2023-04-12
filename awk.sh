printf "\ec\e[44;37m\n"
list=$(awk 'BEGIN {for (i=1; i<=100; i++) print "hello" i "world" i}' )
echo -e "$list" | while read line; do
    l1=$(echo "${line/hello/hi}")
    echo "${l1//world/there}"
done



