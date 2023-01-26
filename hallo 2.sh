#!/bin/bash     
# hallo.sh      : Demo von read und echo
#description    :Lösung zur Aufgabe 1.5a
#date           :20180618
#version        :1      
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

# Skript hallo, liest eine Benutzereingabe und gibt sie wieder aus

echo "Geben Sie Ihren Namen ein: " | tr -d '\n'
read eingabe
echo "Hallo $eingabe"

