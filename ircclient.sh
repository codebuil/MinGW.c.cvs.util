#!/bin/bash
printf "\ec\e[44;37mclient side.......\n"
HOST=$1
PORT="8000"
NICK=$2

# Conecte-se ao servidor na porta especificada
nc $HOST $PORT | while read message; do
 case "$message" in
    "QUIT")
      echo "Usuário desconectado."
      break
      ;;
    *)
      echo "$message"
      ;;
  esac
done


# Envie uma mensagem para o servidor
echo "PRIVMSG $NICK :Ola, mundo!" | nc $HOST $PORT
