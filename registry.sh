#!/bin/bash
printf "\ec\e[44;37m"
# Pede ao usuário para inserir as chaves e valores separados por ponto e vírgula
echo "Insira as chaves e valores separados por ponto e vírgula (ex: key1,value1,value2;key2,value1,value2): "
read input

# Inicializa o registro
registry=""

# Divide a entrada em várias linhas separadas por ponto e vírgula
IFS=';' read -ra lines <<< "$input"

# Loop através de cada linha de chaves e valores
for line in "${lines[@]}"; do
  # Adiciona um tab no início da linha
  registry+=$'\t'
  # Divide a linha em chaves e valores separados por vírgula
  IFS=',' read -ra items <<< "$line"
  # Loop através de cada item da linha
  for i in "${!items[@]}"; do
    # Se for o primeiro item, adicione a chave
    if [[ $i -eq 0 ]]; then
      registry+="${items[i]}:\n"
    # Caso contrário, adicione o valor
    else
      registry+="\t\t${items[i]}\n"
    fi
  done
  # Remove a última vírgula
  registry=${registry%}
  # Adiciona uma quebra de linha
  registry+=$'\n'
done

# Imprime o registro final
echo -e "$registry" > $1
