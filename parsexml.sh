#!/bin/bash
printf "\ec\e[44;37m\n"
if [[ $# -ne 1 ]]; then
  echo "Uso: $0 arquivo_entrada"
  exit 1
fi

entrada=$1
files=/dev/stdout

if [[ ! -f $entrada ]]; then
  echo "Arquivo de entrada não encontrado: $entrada"
  exit 1
fi

sed -e 's/<[^>]*>//g' $entrada | while read line; do    
    if [ "$line" != "" ]; then
		echo "$line" > "$files"
    fi
done



