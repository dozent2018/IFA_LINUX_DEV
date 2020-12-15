#!/bin/bash
# Name:              aufgabe-6.sh
# Themen:            Test von Dateiattributen, Parameter im Script auswerten, Ausgabeumlenkung
# Aufgabe:           Dateiattribute von Verzeichnissen prüfen
# Beispiel-Aufruf:   $ bash aufgabe-6.sh  $HOME / /etc /tmp /foobar
#                    /Users/jochenreinholdt: create file(s) permitted
#                    /: create file(s) not permitted. ls permitted.
#                    /etc: create file(s) not permitted. ls permitted.
#                    /tmp: create file(s) permitted. ls permitted.
#                    /geheim: create file(s) not permitted. ls not permitted.
#                    /foobar: directory not found
#                    $
#
# Hauptfunktionen:   Prüft für beliebig viele übergebene Kommandozeilenargumente, ob
#                    a) ob überhaupt ein Verzeichnis dieses Namens existiert
#                    b) ob Sie den Inhalt des Verzeichnisses mit ls auflisten dürfen
#                    c) ob Sie in dem Verzeichnis Dateien oder Verzeichnisse anlegen dürfen
# Beispiel:
#                    $ bash aufgabe-6.sh / /foobar /tmp $HOME/geheim
#                    /: create file(s) not permitted. ls permitted.
#                    /foobar: directory not found
#                    /tmp: create file(s) permitted. ls permitted.
#                    /home/user1/geheim: create file(s) not permitted. ls not permitted.
#                    $
#
# Fehlerbehandlung:  d) "usage: aufgabe-6.sh <directory> <directory> ..." wird
#                       auf die Standard-Fehlerausgabe ausgegeben, wenn keine Argumente angegeben wurden. 
#                       Diese Meldung soll auch noch stimmen, wenn Sie dieses Script umbennenen 
#                       und nicht den Pfad enthalten, auch wenn sie es mit /home/bin/aufgabe-6.sh
#                       oder mit ./aufgabe-6.sh aufrufen. Anschliessend wird das Script mit dem
#                       Rückgabewert 1 beendet.
#                    e) "/foobar: directory not found" wird
#                       auf die Standard-Fehlerausgabe ausgegeben, wenn eines der Argumente 
#                       (in diesem Fall /foobar) kein Verzeichnis ist. 
#                       Der Shell wird in diesem Fall am Ende der Wert 2 zurückgegeben, 
#                       aber das Script läuft bis zu Ende.
#
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
# ******************** Ihre Lösung: ******************** 

