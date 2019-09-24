#!/bin/bash

file1="id1.txt"
file2="id2.txt"

while read F1
do 
     ont=0
    arq=$F1
    while read F2
    do
       
        arq2=$F2 
        list=0
        if [ $arq -eq $arq2 ]
            then 
                echo "Servico $arq2 OK "
                let cont++
        # else
        #     echo "Servico sem permisao $arq2"
        fi
      
    done <./$file1
    # echo $cont
done <./$file2

