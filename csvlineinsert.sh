#!/bin/bash
printf "\ec\e[44;37m\n"
# Arquivo CSV de entrada
input_file=$3
lline=$1
keys=$2
cont="0"
# Loop através de cada linha do arquivo CSV
while read line; do
    # Separa os campos usando vírgulas como delimitadores
    IFS=',' read -ra fields <<< "$line"

    # Loop através de cada campo e imprime separado por tabs
    if [ "$lline" = "$cont" ]; then
		echo -e "$keys"
	fi 
	echo -e "$line"
    # Imprime uma nova linha para separar as linhas do CSV
   cont=$((cont+1))
done < "$input_file"
