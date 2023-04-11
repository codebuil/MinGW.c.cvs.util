#!/bin/bash
printf "\ec\e[44;37m"
# Pede ao usuário o número do separador e o nome do arquivo CSV
sep=$2
filename=$1

# Usa o comando sort para ordenar o arquivo pelo valor do campo correspondente
sort -t"," -k$sep $filename
