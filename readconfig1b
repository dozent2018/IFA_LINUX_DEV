#!/bin/bash     
#title          :readconfig1a
#description    :Lesen einer Datei mit 2 Spalten, die durch ein Trennzeichen 
#		         getrennt sind. Einfügen in ein assoziatives Array: 
#		         Spalte 1 ist der Schlüssel, Spalte 2 der Wert
#author         :Jochen Reinholdt
#date           :20180823
#version        :1.0    
#usage          :readconfig -d delimiting_character config_file
#notes          :diese Lösung verwendet Bash-Parameterexpansion, um die Spalten der Datei zu lesen
#bash_version   :4.4.12(1)-release
#============================================================================

# Ein assoziatives Array mit dem Namen map deklarieren, dass die 
# Schlüssel/Wert-Paare aus der Konfigurationsdatei  aufnehmen soll
declare -A map

# Die Konfigurationsdatei, die gelesen werden soll, wird auf der Kommandozeile
# als letzter Parameter angegeben
# Wenn mit -d ein anderes Trennzeichen als das Leerzeichen angegeben wurde, 
# Ist es der 3. Parameter, ansonsten der 1.

if [ $1 == "-d" ]
then
    delimiter=$2
    config_file=$3
else
    delimiter=" "
    config_file=$1
fi
# 2do: mögliche Fehler beim Aufruf abfangen (anzahl Parameter, existiert Datei usw.)

# Die gesamte aktuelle  Zeile wird in der Schleife der Variablen line zugewiesen
while read line
do
	# Leerzeilen ignorieren
	if [ ! -z "$line" ]
	then
		# Trennzeichen und alles danach abschneiden mit Bash-Parameterexpansion
		key=${line%$delimiter*}
		# Trennzeichen und alles davor abschneiden
		value=${line#*$delimiter}
		map[$key]=$value
	fi
done < $config_file
# 2do: Andere mögliche Fehler in der Konfigurationsdatei abfangen

# Ausgabe des Array zum Testen
for key in ${!map[@]}
do
	echo key:$key value:${map[$key]}
done
