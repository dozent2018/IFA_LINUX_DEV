#!/bin/bash
# vorzeichen.sh : prüft den übergebenen wert auf positiv, negativ oder 0

if [ $1 -eq 0 ]
then
    echo $1 ist NULL
else
    if [ $1 -gt 0 ]
    then 
        echo $1 ist positiv
    else
        echo $1 ist negativ
    fi
fi

