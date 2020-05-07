#!/bin/bash     
#title          :readconfig1c.sh
#description    :Lesen einer Konfigurationsdatei in ein Array
#author         :Patrick Raths
#date           :20200507
#version        :1.0    
#usage          :./readconfig1c.sh
#notes          :       
#bash_version   :3.2.57(1)-release
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
