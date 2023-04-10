#!/bin/bash
printf "\ec\e[44;37m\n"
# Arquivo CSV de entrada
input_file=$1

# Loop através de cada linha do arquivo CSV
while read line; do
    # Separa os campos usando vírgulas como delimitadores
    IFS=',' read -ra fields <<< "$line"

    # Loop através de cada campo e imprime separado por tabs
    for field in "${fields[@]}"; do
        printf "%s\t" "$field"
    done

    # Imprime uma nova linha para separar as linhas do CSV
    echo ""
done < "$input_file"
