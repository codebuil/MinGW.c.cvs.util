#!/bin/bash
printf "\ec\e[44;37m"
# Define o arquivo a ser editado
file=$1

# Loop principal
while true; do
  # Imprime o arquivo com número de linha
  nl "$file"
  
  # Solicita o número da linha a ser alterada
  read -p "Digite o número da linha a ser alterada (ou enter para sair): " linha
  
  # Sai do loop se o usuário não informar o número da linha
  if [[ -z "$linha" ]]; then
    echo "Encerrando o programa..."
    break
  fi
  
  # Solicita o novo texto para a linha escolhida
  read -p "Digite o novo texto para a linha $linha: " texto
  
  # Altera a linha escolhida com o novo texto
  sed -i "${linha}s/.*/${texto}/" "$file"
  
  echo "Linha $linha alterada com sucesso!"
done
