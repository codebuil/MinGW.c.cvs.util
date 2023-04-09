#!/bin/bash

# Define a porta em que o servidor será executado
PORT=8000

# Define o diretório raiz do servidor
ROOT_DIR=~/serial
printf "\ec\e[44;37mstart server....\n"
# Inicia o loop de servidor
while true; do
    # Aguarda a conexão de um cliente
    nc -l -w1 $PORT > request.txt

    # Extrai o nome do arquivo da primeira linha da solicitação HTTP
    FILENAME=$(head -n 1 request.txt | cut -d' ' -f2)
	
    # Verifica se o arquivo solicitado existe no diretório raiz
    if [ -f "$ROOT_DIR$FILENAME" ]; then
        # Define o cabeçalho HTTP de resposta
        RESPONSE="HTTP/1.1 200 OK\r\n\r\n"

        # Adiciona o conteúdo do arquivo ao corpo da resposta
        RESPONSE+="$(cat $ROOT_DIR$FILENAME)"

        # Envia a resposta ao cliente
        echo -e "$RESPONSE" | nc -l -w1 $PORT
    else
        # Se o arquivo não existir, envia uma resposta de erro 404
        RESPONSE="HTTP/1.1 404 Not Found\n\n"
        RESPONSE+="File not found: $FILENAME\n\n"

        # Envia a resposta ao cliente
        echo -e "$RESPONSE" | nc -l -w1 $PORT
    fi

    # Limpa a solicitação
    rm request.txt
done

