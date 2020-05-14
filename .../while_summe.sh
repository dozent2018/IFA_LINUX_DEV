#!/bin/bash     
# while_summe.sh : Summiert alle übergebenen Parameter in while-Schleife
#author         :Jochen Reinholdt
#date           :20190430
#version        :1.0    
#usage          :./while_summe
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================
echo Anzahl Parameter: $#
anzahl=$#
zaehler=0
summe=0

while [ $zaehler -lt $anzahl ]
do
    let summe=$summe+$1
    echo Summe: $summe
    let zaehler=$zaehler+1
    shift
done
echo $summe

