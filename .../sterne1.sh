#!/bin/bash     
# sterne1.sh    :Gibt in einer for-schleife 10 sterne aus
#author         :Jochen Reinholdt
#date           :20180619
#version        :1      
#usage          :./sterne1
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

for ((i=1;i<=$1;i++))
do
	echo -n \*
done
echo
