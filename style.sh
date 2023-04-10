#!/bin/bash
printf "\ec\e[44;37m"
# Verifica se o arquivo de entrada foi fornecido como argumento
if [ -z "$1" ]; then
    echo "Erro: O nome do arquivo de entrada deve ser fornecido como argumento."
    exit 1
fi

# Verifica se o arquivo de entrada existe
if [ ! -f "$1" ]; then
    echo "Erro: O arquivo de entrada '$1' não existe."
    exit 1
fi

# Cria um arquivo temporário para armazenar o HTML sem o conteúdo da tag <style>
tmpfile=$(mktemp)
sed '/<style>/,/<\/style>/d' "$1" > "$tmpfile"

# Move o arquivo temporário para o arquivo de saída
cat $tmpfile
mv "$tmpfile" "$1"
