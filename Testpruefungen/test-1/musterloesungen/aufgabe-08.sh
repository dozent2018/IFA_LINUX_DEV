#!/bin/bash
# Name:              aufgabe-8.sh
# Themen:            Lokale Systemsicherheit, finden von Dateien mit bestimmten Eigenschaften
# Aufgabe:           Schreiben Sie eine Kommandozeile, die folgende Aufgabe erfüllt:
#                    Alle Dateien im System, die dem user root gehören und bei denen das SUID-Bit gesetzt
#                    ist, sollen aufgelistet werden. Das Kommando wird mit sudo oder als root ausgeführt
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
#                       Änderung
# ******************** Ihre Lösung: ******************** 
  
find / -user root -perm -u+s -exec ls -ldb {} \;

# oder
# find / -user root -perm -4000 -exec ls -ldb {} \;

