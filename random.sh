#!/bin/bash
printf "\ec\e[44;37m"
# Define o número de linhas que serão geradas
num_linhas=50
arquivo=$1

# Cria o arquivo .csv
echo "Numero da linha,Valor aleatorio" > $arquivo

# Loop para gerar os valores aleatórios
for (( i=1; i<=$num_linhas; i++ ))
do
    # Gera um número aleatório entre 1 e 50
    valor_aleatorio=$((1 + RANDOM % 50))

    # Adiciona a linha ao arquivo .csv
    echo "$i,$valor_aleatorio" >> $arquivo
done

echo "Arquivo gerado com sucesso!"
