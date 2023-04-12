# Pede o nome do arquivo XML
printf "\ec\e[44;37m\n"
filename=$1
# Verifica se o arquivo existe
if [ ! -f $filename ]; then
  echo "Arquivo $filename não encontrado"
  exit 1
fi

# Faz o parse do arquivo XML e exibe cada coluna
awk -F'[<>]' '/<\/.*>/ {if (NF>3) print $(NF-1)}' $filename
