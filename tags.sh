#!/bin/bash
printf "\ec\e[44;37m\n"
if [[ $# -ne 2 ]]; then
  echo "Uso: $0 arquivo_entrada arquivo_saida"
  exit 1
fi

entrada=$1
saida=$2

if [[ ! -f $entrada ]]; then
  echo "Arquivo de entrada não encontrado: $entrada"
  exit 1
fi

sed -e 's/<[^>]*>//g' $entrada > $saida

echo "Arquivo de saída gerado com sucesso: $saida"
exit 0
