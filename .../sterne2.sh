#!/bin/bash     
# sterne2.sh   :Gibt in einer for-schleife soviel sterne aus, wie in Parameter1 angegeben ist
#author         :Jochen Reinholdt
#date           :20180619
#version        :1      
#usage          :./sterne2 anzahl
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

for (( i=1; i<=$1; i++ ))
do
	echo -n \*
done
echo
