#!/bin/bash
# Name        : countdown2
# Beschreibung: Countdown mit Startwert und diversen Prüfungen
# Autor       : Jochen Reinholdt
# Version     : 1.0
# Datum       : 20200505
# ================================================================ 

# Ist die richtige Anzahl Parameter übergeben worden?
if [ $# -ne 1  ]
then
    echo "usage: $(basename $0) startvalue" 1>&2 
    exit 1
fi
# Ist der Startwert-Parameter grösser als Null?
if [ "$1" -lt 0  ] 2> /dev/null
then
   echo "startvalue must not be negative" 1>&2
   exit 2
fi
# Ist der Startwert-Parameter eine Zahl?
# Wenn eine Variable mittels -eq mit sich selbst verglichen wird
# liefert das nur dann WAHR (0), wenn es eine ganze Zahl ist
if ! [ "$1" -eq "$1" ] 2> /dev/null
then
  echo "startvalue $1 is not a number" 1>&2
  exit 3
fi

counter=$1
# den eigentlichen Countdown starten mit while-Schleife
while [ $counter -gt 0  ]
do
  echo $counter
  let counter--
done
echo Start!

# Am Ende "Start!" ausgeben
