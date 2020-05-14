#!/bin/bash     
# readconfig1c.sh : Variante zu readconfig1a.sh mit IFS=
#description    :Lesen einer Konfigurationsdatei in ein Array
#author         :Patrick Raths
#date           :20200507
#version        :1.0    
#notes          :       
#bash_version   : 4
#============================================================================

declare -A array

file=$1

while IFS='=' read -r key value 
do
        array[$key]=$value
done < "$file"


for key in ${!array[@]}
do
        echo "$key ist ${array[$key]}"
done
