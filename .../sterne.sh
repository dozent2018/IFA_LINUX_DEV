#!/bin/bash     
# sterne.sh     :Schreibt mit for soviele Sterne, wie auf der Kommandozeile angegeben
#author         :Jochen Reinholdt
#date           :20181108
#version        :1      
#usage          :./sterne anzahl
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

waagerecht=$1

for (( anzahl=1; anzahl<=$waagerecht; anzahl++ ))
do
    echo -n \*
done
echo
