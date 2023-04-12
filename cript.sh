printf "\ec\e[44;37m"
echo "hello world" | openssl enc -aes-256-cbc -k 12345 -out hello.txt
