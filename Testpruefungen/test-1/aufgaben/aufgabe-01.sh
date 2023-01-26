# !/bin/bash
# Name:              aufgabe-1.sh
# Aufgabe:           Schreiben Sie ein Script, das die folgenden Anforderungen erfüllt:
# Hauptfunktion:     a) Liest eine Textdatei und gibt die Zeilen nummeriert aus. 
#                    b) Anschliessend gibt es
#                       die Anzahl der gelesenen Zeilen in folgender Form auf stdout aus:
#                       "<Anzahl> lines read from test.txt"
#                    c) Auch bei einer leeren Datei soll diese Ausgabe einen sinnvollen
#                       Inhalt haben.
#                    
# Beispiel:          $ bash countlines.sh test.txt
#                    1 Erste Zeile
#                    2 Zweite Zeile
#                    3 Dritte Zeile
#
#                    3 lines read from test.txt 
#                    $
#
# Fehlerbehandlung:  Es sollen folgende Fehlermöglichkeiten behandelt werden:
#                    d) Dem Script wurde nicht genau 1 Argument (Dateiname) übergeben 
#                       Reaktion: Fehlermeldung auf stderr:
#                       "usage: aufgabe-1.sh text-file"
#                       Beenden des Skrips mit Exit-Code 1
#                    e) Die Datei existiert nicht
#                       Reaktion: Fehlermeldung auf stderr:
#                       "error: test.txt not found."
#                       Beenden des Skrips mit Exit-Code 2
#                    f) Ein Verzeichniseintrag test.txt existiert, ist aber keine normale Datei
#                       Reaktion: Fehlermeldung auf stderr:
#                       "error: test.txt is not a normal file."
#                       Beenden des Skrips mit Exit-Code 3
#                    g) Die Datei existiert, der Benutzer hat aber kein Leserecht 
#                       Reaktion: Fehlermeldung auf stderr:
#                       "error: cannot read test.txt. Permission denied."
#                       Beenden des Skrips mit Exit-Code 4
#                    
# Einschränkungen:   1. Verwenden Sie keine externen Kommandos wie 
#                       nl oder wc, sondern ausschliesslich
#                       bash-Schlüsselwörter und bash-builtins für Ihre Lösung.
#                    2. Benennen sie diese Datei nicht um. 
#                    3. Verwenden Sie keine andere Shell als /bin/bash

# ******************** Ihre Lösung: ******************** 

