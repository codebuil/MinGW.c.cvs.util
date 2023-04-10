#!/bin/bash
printf "\ec\e[44;37m"
if [ -z "$1" ]
then
    echo "Por favor, especifique um nome de servidor."
    exit 1
fi

ip=$(nslookup "$1" | awk '/^Address: / { print $2 }')

if [ -z "$ip" ]
then
    echo "Não foi possível encontrar o endereço IP do servidor."
    exit 1
fi

echo "O endereço IP do servidor $1 é $ip."
