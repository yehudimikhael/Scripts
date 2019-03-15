#!/bin/bash

###################################################################
#Script Name	:  Loop insert                                                                                             
#Description	:  Script para a inserção de variaveis de Ambiente pegando de um arquivo                                                                               
#Args           	:                                                                                           
#Author       	:Yehudi Brito                                                
#Email         	:yehudi.brito@concrete.com.br                                           
###################################################################

while read F
do
  snap=$snap" $F"
done <./$1
echo $snap
echo "########################"
echo "## 1) Dados Privados ###"
echo "## 2) Dados Publicos ###"
echo "########################"
echo "Escolha a opcao: "
read OPCAO
case $OPCAO in 
  1)
    echo "Dados Privados";;
    tsuru env-set $F -a $2 -p --no-restart
  2)
    echo "Dados Publicos";;
    tsuru env-set $F -a $2 --no-restart
  *) echo "Opcao invalida";;
esac
