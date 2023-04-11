#!/bin/bash
printf "\ec\e[44;37m"
# nome do arquivo a ser editado
filename=$1

# imprime o arquivo com número de linhas
cat -n $filename

# loop para inserção de linhas
while true
do
    echo "Digite o número da linha a ser inserida (ou vazio para sair):"
    read line_number

    # verifica se o usuário quer sair
    if [ -z $line_number ]; then
        break
    fi

    echo "Digite o texto da linha a ser inserida:"
    read new_line

    # adiciona a nova linha no arquivo
    sed -i "${line_number}i${new_line}" $filename

    echo "Linha inserida com sucesso!"
    echo ""

    # imprime o arquivo atualizado com número de linhas
    cat -n $filename
done

echo "Programa encerrado."
