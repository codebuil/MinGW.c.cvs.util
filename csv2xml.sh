#!/bin/bash
printf "\ec\e[44;37m\n"
# Pede ao usuário o nome do arquivo .csv
csv_file=$1

# Pede ao usuário o nome do arquivo .xml
xml_file=/dev/stdout

# Cria o cabeçalho do arquivo .xml
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > $xml_file
echo "<table>" >> $xml_file

# Lê as linhas do arquivo .csv e converte em formato .xml
while IFS=',' read -r field1 field2 field3
do
    echo "  <row>" >> $xml_file
    echo "    <column1>$field1</column1>" >> $xml_file
    echo "    <column2>$field2</column2>" >> $xml_file
    echo "    <column3>$field3</column3>" >> $xml_file
    echo "  </row>" >> $xml_file
done < $csv_file

# Fecha a tabela e salva o arquivo .xml
echo "</table>" >> $xml_file

echo "Arquivo $csv_file convertido com sucesso para $xml_file"
