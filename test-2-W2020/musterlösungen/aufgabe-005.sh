#!/bin/bash
# Name:              aufgabe-005.sh
#
# Max. Punkte:       4
#
# Themenbereich:     Systeminformationen abfragen
#
# Schreiben Sie  Script, das die folgenden Anforderungen erfüllt:
# Hauptfunktion:     a) Zeigt die Zeit des letzen Systemstarts an
#                    b) Die Form der Ausgabe ist (Beispiel):
#                      'Das System läuft seit 2020-08-13 15:17:15'
#
# Fehlerbehandlung:  Keine
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
# Hinweise:          Die Aufgabe kann mit einer Zeile gelöst werden, 
#                    aber auch mit mehreren Zeilen
# ******************** Ihre Lösung: ******************** 
echo "Das System läuft seit $(uptime -s)"
