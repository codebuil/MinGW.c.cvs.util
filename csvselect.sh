#!/bin/bash
printf "\ec\e[44;37m\n"
# Arquivo CSV de entrada
input_file=$3
seps=$1
keys=$2
# Loop através de cada linha do arquivo CSV
while read line; do
    # Separa os campos usando vírgulas como delimitadores
    IFS=',' read -ra fields <<< "$line"

    # Loop através de cada campo e imprime separado por tabs
    field="${fields[$seps]}"
    if [ "$field" = "$keys" ]; then
		echo -e "$line"
	fi 

    # Imprime uma nova linha para separar as linhas do CSV
   
done < "$input_file"
