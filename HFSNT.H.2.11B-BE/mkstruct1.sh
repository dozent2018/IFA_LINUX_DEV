# mkstruct1.sh legt eine feste Vereichnisstruktur mit dem mkdir-Kommando an
# mit Auswertung einer vorher gesetzten Variablen
# wenn sie nicht existiert oder leer ist, soll der Default-Name "Kurs" sein
Wurzel=${KURSNAME:-Kurs}
mkdir -p ${Wurzel}/block1/aufgaben
mkdir -p ${Wurzel}/block1/loesungen
# usw ...
