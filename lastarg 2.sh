#!/bin/bash
# Zeigt verschiedne möglichkeiten, bei einer unbekannten Anzahl
# von Argumenten auf das letzte Argument zuzugreifen

echo "Last argument: ${@: -1}" 
echo "Last argument: ${!#}" 
echo "Last argument: $BASH_ARGV" 
echo "Last argument: ${@:$#}" 
echo "Last argument: ${BASH_ARGV[0]}"

echo -n "Last argument: " 
for  i  in $@;  do :;  done  
echo "$i"
