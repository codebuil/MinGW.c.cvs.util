#!/bin/bash
PORT="8000"

# Cria um arquivo temporário para armazenar as mensagens dos usuários
rm /tmp/irc
mkfifo /tmp/irc
printf "\ec\e[44;37mserver start....\n"
# Inicie o servidor nc na porta especificada
nc -lk $PORT < /tmp/irc | tee -a /tmp/irc | while true; do
  read message
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


# Remova o arquivo temporário quando o servidor for encerrado
rm /tmp/irc
