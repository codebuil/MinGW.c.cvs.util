#!/bin/bash
printf "\ec\e[44;37m\n"
bash service.sh &
sleep 2
while true; do
  (echo -e "HTTP/1.1 200 OK\r\n";
   echo -e "Content-Type: $(file -b --mime-type index.html)\r\n";
   echo -e "Content-Length: $(wc -c < index.html)\r\n";
   echo -e "Content-Disposition: attachment; filename=\"index.html\"\r\n";
   cat index.html) | nc -q0 -l -p 8000
done
