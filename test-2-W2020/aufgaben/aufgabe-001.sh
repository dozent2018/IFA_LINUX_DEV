#!/bin/bash
# Name:              aufgabe-001.sh
#
# Max. Punkte:       8
#
# Themenbereich:     Suchen und ersetzen von Text
#
# Schreiben Sie ein  Script, das die folgenden Anforderungen erfüllt:
# Hauptfunktion:     Liest die  Datei test.txt:
#
#                    1 Zeilentext 1
#                    002 Zeilentext 2
#                    3. Zeilentext 3
#                    4) Zeilentext 4
#                    Zeilentext 5
#
#                    und gibt Zeilen ohne die Nummeierung am Zeilenanfang auf die
#                    Standardausgabe aus. 
#                    Zeilen ohne Nummerierung am Zeilenanfang sollen 
#                    unverändert ausgegeben werden.
#
#                    Die Datei wird als 1. Argument übergeben. Beispiel:
#                    ./aufgabe-001.sh test.txt
#                    hat die Ausgabe:
#                    Zeilentext 1
#                    Zeilentext 2
#                    Zeilentext 3
#                    Zeilentext 4
#                    Zeilentext 5
#
#                    Ohne Angabe einer Datei liest das Script von der 
#                    Standardeingabe. Beispiel:
#                    cat test.txt |  ./aufgabe-001.sh
#
# Fehlerbehandlung:  Keine
#
# Einschränkungen:   1. Benennen Sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
#
# Hinweise:          Die Aufgabe kann mit einem einem einzigen Kommando 
#                    gelöst werden. Sie können die Datei test.txt 
#                    zum Testen verwenden
# ******************** Ihre Lösung: ******************** 
