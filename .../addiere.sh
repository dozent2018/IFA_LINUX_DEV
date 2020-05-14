#!/bin/bash
# addiere.sh : demonstriert prüfung von $1 und $2 auf integer und addiert sie
if [ $# -ne 2 ]
then
    echo "Fehler: es müssen zwei ganze Zahlen sein" 
elif  ! [ $1 -eq $1 ] 2>/dev/null
then
    echo "$1 ist keine ganze Zahl"
elif  ! [ $2 -eq $2 ] 2>/dev/null
then
    echo "$2 ist keine ganze Zahl" 
else
    let ergebnis=$1+$2
    echo $ergebnis
fi
