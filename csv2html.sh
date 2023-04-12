#!/bin/bash
printf "\ec\e[44;37m\n"
# Pergunta ao usuário qual arquivo CSV ele deseja converter
csv_file=$2

# Pergunta ao usuário quais colunas do arquivo CSV ele deseja exibir na tabela HTML
columns=$1

# Cria o cabeçalho da página HTML
echo "<html>
<head>
  <title>Tabela gerada a partir do arquivo CSV</title>
</head>
<body>
  <table border=\"1\" cellpadding=\"5\" cellspacing=\"0\">
    <tr style=\"background-color: #3498db; color: #fff;\">"

# Gera as colunas da tabela com base nas colunas selecionadas pelo usuário
for column in $columns; do
  echo "      <th>$column</th>"
done

# Fecha a linha de cabeçalho e começa a imprimir os dados da tabela
echo "    </tr>"

# Loop através do arquivo CSV e exibe cada linha na tabela
while IFS=',' read -ra row; do
  echo "    <tr>"
  for column in $columns; do
    index=$(awk -v col="$column" -F',' 'NR==1{for(i=1;i<=NF;i++)if($i==col){print i; break}}' "$csv_file")
    echo "      <td>${row[$index]}</td>"
  done
  echo "    </tr>"
done < "$csv_file"

# Fecha a tabela e a página HTML
echo "  </table>
</body>
</html>"
