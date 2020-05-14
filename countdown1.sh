#!/bin/bash     
# countdown1.sh : Demonstration while-Schleife
#description    :Zählt vom Wert in $1 auf 0 herunter und gibt dann Start! aus
#date           :20180619
#version        :1      
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================
zaehler=$1

while [ $zaehler -ge 0 ]
do
	echo $zaehler
	let zaehler=$zaehler-1
done

echo Start!
