#!/bin/bash
printf "\ec\e[44;37m"
# Cria um novo arquivo chamado 'texto.txt'
echo "" > $1

# Pede ao usuário que insira texto
echo "Digite o seu texto:"

# Loop que lê as linhas de entrada do usuário até que uma linha em branco seja inserida
while read linha
do
    if [ -z "$linha" ]; then
        break
    else
        echo $linha >> $1
    fi
done

echo "Texto salvo em $1"
