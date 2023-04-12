#!/bin/bash
# Gera uma senha aleatória de 12 caracteres de letras minúsculas
printf "\ec\e[44;37m"
# Define o alfabeto de letras minúsculas
ALFABETO="abcdefghijklmnopqrstuvwxyz"

# Gera uma senha aleatória de 12 caracteres
PASSWORD=$(cat /dev/urandom | tr -dc $ALFABETO | fold -w 12 | head -n 1)

# Imprime a senha gerada
echo $PASSWORD
