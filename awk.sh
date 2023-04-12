printf "\ec\e[44;37m\n"
files=/dev/stdout
list=$(awk 'BEGIN { srand(); for(i=1; i<=100; i++) { printf("%d,%d\n",i, int(50*rand())+1) } }')
echo -e "$list" | while read line; do    
    echo "$line" > "$files"
done



