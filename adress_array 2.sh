#!/bin/bash     
# adress_array.sh : Lesen von Datei, speichern von key/value in assoziatives Array und Suche
#author         :Pro Linux.de, Dezember 2017
#============================================================================
declare -A Adresse

Speichere_Adresse ()
  {
  Adresse["$1"]="$2"
  return $?
  }


Suche_Adresse ()
  {
  if [ ${Adresse[$1]+_} ]
  then
    echo "$1's Adresse lautet ${Adresse[$1]}."
    return $?
  else
    echo "$1's Adresse ist nicht vorhanden."
    return 99
  fi
  }

# Adressen aus CSV-Datei einlesen
while read LINE; do
  NAME=$(echo $LINE | cut -d';' -f1)
  ADDR=$(echo $LINE | cut -d';' -f2)
  Speichere_Adresse "$NAME" "$ADDR"
done < adressen.csv

# Testaufrufe
Suche_Adresse "Donald Duck"
Suche_Adresse "Harry Potter"
Suche_Adresse "Jules Maigret"
Suche_Adresse "Sherlock Holmes"
Suche_Adresse "Herman Munster"
Suche_Adresse "Thomas A. Edison"
Suche_Adresse "John Doe"


