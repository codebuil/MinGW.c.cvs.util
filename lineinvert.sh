#!/bin/bash
printf "\ec\e[44;37m"
# Definir o nome do arquivo de entrada e saída
input_file=$1
output_file=$2
echo "" > "$output_file"
# Criar um array para armazenar as linhas do arquivo de entrada
lines=()

# Ler o arquivo de entrada e armazenar as linhas no array
while IFS= read -r line; do
    lines+=("$line")
done < "$input_file"

# Inverter a ordem das linhas do array
lines_reversed=("${lines[@]}")
for (( i=${#lines[@]}-1; i>=0; i-- )); do
    lines_reversed[${#lines[@]}-i-1]="${lines[$i]}"
done

# Escrever as linhas invertidas no arquivo de saída
for line in "${lines_reversed[@]}"; do
    echo "$line" >> "$output_file"
done
