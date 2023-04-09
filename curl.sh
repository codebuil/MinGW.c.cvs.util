#!/bin/bash
printf "\ec\e[44;37m\n"

# Construa a string HTTP de solicitação GET
REQUEST="GET /$3 HTTP/1.1\r\nHost: $1\r\n\r\n"

# Enviar solicitação HTTP para o servidor
echo -e "$REQUEST" | nc $1 $2

# Receber a resposta do servidor e exibir na tela
nc -w 5 $1 $2 < /dev/null
