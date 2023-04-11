#!/bin/bash
printf "\ec\e[44;37m"
# Verifica se o arquivo de entrada foi fornecido
if [ -z "$1" ]; then
  echo "Uso: $0 arquivo.csv"
  exit 1
fi

# Cria um arquivo temporário para armazenar o arquivo de saída
tempfile=$(mktemp)

# Loop através do arquivo de entrada e substitui todas as vírgulas por ponto e vírgula
while IFS=, read -r line; do
  new_line=$(echo "$line" | sed 's/,/;/g')
  echo "$new_line" >> "$tempfile"
done < "$1"

# Renomeia o arquivo temporário para o nome do arquivo de entrada
mv "$tempfile" "$1"
