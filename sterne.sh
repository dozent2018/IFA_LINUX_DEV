#!/bin/bash     
# sterne.sh     : Schreibt mit for soviele Sterne, wie in $1 angegeben
#date           :20181108
#version        :1      
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

waagerecht=$1

for (( anzahl=1; anzahl<=$waagerecht; anzahl++ ))
do
    echo -n \*
done
echo
