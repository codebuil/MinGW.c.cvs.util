#!/bin/bash
printf "\ec\e[44;37m"
# Pedir o nome do ficheiro CSV de entrada
filenames="$1"
function pad_zeros {	
	local value="$1"
	local size="$2"
	local zeros="$(printf '%0.1s' " "{1..20})"
	echo "${zeros}${value}" | tail -c $size
}

# Verificar se o ficheiro existe
if [ ! -f "$filenames" ]; then
  echo "O ficheiro não existe!"
  exit 1
fi

# Definir tamanho máximo para cada campo
DATE_SIZE=11
DESC_SIZE=20
VALUE_SIZE=20



# Mostrar os valores formatados na saída padrão
echo "Data      | Designação          | Valor              "
echo "----------|--------------------|--------------------"

# Variável para somar os valores numéricos
total=0

# Ler o ficheiro CSV linha por linha
while IFS=',' read -r date description value; do
   #Ignorar linhas em branco
  if [ -z "$date" ]; then
    continue
  fi

  # Formatando os campos com o tamanho máximo
  date=$(pad_zeros "$date" "$DATE_SIZE")
  description=$(pad_zeros "$description" "$DESC_SIZE")
  values=$(pad_zeros "$value" "$VALUE_SIZE")

  # Somando o valor numérico
  if [ "$value" = "valor" ]; then
	value="+0"
  fi
  total="$total $value "

  total=$(echo $total | bc)
  total=$(pad_zeros "$total" "$VALUE_SIZE")
  # Imprimir a linha formatada
  
  echo "$date | $description | $values | $total"
done < "$filenames"

# Formatando o total com o tamanho máximo
total=$(pad_zeros "$total" "$VALUE_SIZE")

# Imprimir a soma dos valores numericos
echo "----------|--------------------|--------------------"
echo "Total     |                    | $total"


