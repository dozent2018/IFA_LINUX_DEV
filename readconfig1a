#!/bin/bash     
#title          :readconfig1a
#description    :Lesen einer Datei mit 2 Spalten, die durch ein Trennzeichen 
#		         getrennt sind. Einfügen in ein assoziatives Array: 
#		         Spalte 1 ist der Schlüssel, Spalte 2 der Wert
#author         :Jochen Reinholdt
#date           :20180823
#version        :1.0    
#usage          :readconfig -d delimiting_character config_file
#notes          :Diese Lösung verwendet IFS und zwei Variablen bei read
#bash_version   :4.4.12(1)-release
#============================================================================

# Ein assoziatives Array mit dem Namen map deklarieren, dass die 
# Schlüssel/Wert-Paare aus der Konfigurationsdatei  aufnehmen soll
declare -A map

# Die Konfigurationsdatei, die gelesen werden soll, wird auf der Kommandozeile
# als letzter Parameter angegeben
# Wenn mit -d ein anderes Trennzeichen als das Leerzeichen angegeben wurde, 
# Ist es der 3. Parameter, ansonsten der 1.
# IFS wird dem gewählten Trennzeichen entsprechend gesetzt. 
# Vorher wird der Inhalt von IFS in OLDIFS gesichert
OLDIFS=$IFS
if [ $1 == '-d' ]
then
    IFS=$2
    config_file=$3
else
    IFS=' '
    config_file=$1
fi
# 2do: mögliche Fehler beim Aufruf abfangen (Anzahl Parameter, existiert Datei usw.)

# Konfigurationsdatei zeilenweise lesen. 2 Variablen hinter read nehmen die Inhalte
# der beiden Spalten auf. 1 Spalte ist der Schlüssel (key), die 2. Spalte der Wert(value)
while read key value
do
    map[$key]=$value
done < $config_file

# Wichtig: IFS nach Veränderung immer wieder auf den alten Wert zurücksetzen!!!
IFS=$OLDIFS

# 2do: Andere mögliche Fehler in der Konfigurationsdatei abfangen

# Ausgabe des Array zum Testen
for key in ${!map[@]}
do
	echo key:$key value:${map[$key]}
done
