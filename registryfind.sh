#!/bin/bash
printf "\ec\e[44;37m"
# Definir o nome do arquivo de entrada e saída
input_file=$1
line2=""
line3=0
keys=$2
output_file=/dev/stdout

# Criar um array para armazenar as linhas do arquivo de entrada
lines=()

# Ler o arquivo de entrada e armazenar as linhas no array
while IFS= read -r line; do
    lines+=("$line")
done < "$input_file"

# Inverter a ordem das linhas do array
lines_reversed=("${lines[@]}")

# Escrever as linhas invertidas no arquivo de saída
for line in "${lines_reversed[@]}"; do
    # Substituir os dois pontos por uma vírgula
    line2="$line"
    line="${line/:/}"
    if [ "$line" = "$line2" ]; then
		if [ "$line3" = "1" ]; then
			line="${line:1}"
			printf "$line\n"
		fi
    else
		if [ "$line" = "$keys" ]; then
			line3="1"
		else
			line3="0"		
		fi
		
    fi
     
done
