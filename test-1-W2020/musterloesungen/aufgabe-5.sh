#!/bin/bash
# Name:              aufgabe-5.sh
# Themen:            Prozesse, Kommandos zur Textsuche, Text-Sortierung und Text-Manipulation
# Aufgabe:           Schreiben Sie eine Kommandozeile, die folgende Aufgaben erfüllt:
# Hauptfunktion:     1. Alle Prozesse finden, deren ausführbare Programme
#                       einen bestimmten String, z.B. "ssh" im Namen enthalten.
#                       Dieser String soll Ihrem Script als Argument übergeben werden
#                    2. Die Prozess-ID des Elternprozesses, die eigene Prozess-ID und 
#                       den Namen des ausgeführten Programms anzeigen (in dieser Reihenfolge)
#                    3. Die Ausgabe ist nach der Prozess-ID des Elternprozesses aufsteigend
#                       sortiert
# Beispiel:
#                    $   aufgabe-005.sh 'ssh' 
#                    1 889 /usr/sbin/sshd
#                    889 1613 sshd:
#                    1613 1815 sshd:
#                    1816 21170 grep
#                    $
#
# Fehlerbehandlung:  Keine
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
# ******************** Ihre Lösung: ******************** 
string=$1
ps -ef |  awk '{print $3,$2,$8 }' | grep $string| sort -n
