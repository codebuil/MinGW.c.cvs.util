#!/bin/bash
printf "\ec\e[44;37m"
# Define o nome do arquivo
file=/dev/stdout

# Define a data do mês de maio
data="2023/05/"

# Define o valor inicial do contador
cont=1

# Cria o cabeçalho do arquivo CSV
echo "data,desig,valor" > $file

# Loop para gerar as linhas do arquivo CSV
for i in {1..31}
do
  # Define o valor da designação
  desig="desig$cont"

  # Define o valor do campo valor alternando entre +100.00 e -100.00
  if (( $i % 2 == 0 ))
  then
    valor="-100.00"
  else
    valor="+100.00"
  fi

  # Adiciona a linha ao arquivo CSV
  echo "$data$i,$desig,$valor" >> $file

  # Incrementa o contador
  cont=$((cont+1))
done
