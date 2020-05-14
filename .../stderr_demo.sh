#!/bin/bash
# stderr_demo.sh : demonstriert die generelle Umlenkung von
# Dateideskriptor 2 in eine Datei für alle Kommandos 

exec 2>> errors.log # stderr für alle folgenden Kommandos umlenken

echo "Eigene Ausgabe nach stdout"
echo "Eigene Ausgabe nach stderr" 1>&2
rm -rf DieseDateiGibtsNicht
# das folgende ls-Kommando führt zu einer Fehlermeldung
ls DieseDateiGibtsNicht 

