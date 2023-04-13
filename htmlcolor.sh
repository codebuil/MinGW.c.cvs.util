#!/bin/bash
printf "\ec\e[44;30m\n"
arquivo=$1
# Cores
red="\033[44;31m"
yellow="\033[44;33m"
cyan="\033[44;36m"
pink="\033[44;35m"
white="\033[44;30m"
temp=/tmp/html
printf "" > $temp
# Ler o arquivo HTML
while read -r line; do
  # Verificar se o line contém um título
  if [[ $line == *"<title>"* ]]; then
    echo -e "${red}$line${white}" >> $temp
  # Verificar se o line contém um cabeçalho de primeiro nível
  elif [[ $line == *"<h1>"* ]]; then
    echo -e "${yellow}$line${white}" >> $temp
  # Verificar se o line contém um cabeçalho de segundo nível
  elif [[ $line == *"<h2>"* ]]; then
    echo -e "${cyan}$line${white}" >> $temp
  # Caso contrário, imprimir em rosa
  else
    echo -e "${pink}$line${white}" >> $temp
  fi
done < $arquivo

sed -e 's/<[^>]*>//g' $temp
