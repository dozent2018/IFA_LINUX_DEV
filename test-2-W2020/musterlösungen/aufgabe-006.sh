#!/bin/bash
# Name:              aufgabe-006.sh
#
# Max. Punkte        10
#
# Themenbereich:     Shell-Funktionen definieren und nutzen
#
# Hauptfunktion      a) Erzeugen Sie eine Funktionsbibliothek mylib, in der
#                    die Funktion am_i_root() definiert wird. 
#                    Sie prüft, ob sie vom user root aufgerufen wurde.
#                    Wenn ja, gibt sie den Wert 0 zurück, wenn nein 1.
#                    Die Datei mylib soll im Verzeichnis 
#                    /home/student/loesungen liegen
#
#                    b) Schreiben Sie hier in aufgabe-006.sh die nötigen 
#                       Anweisungen, um die Funktion zur Verfügung zu haben 
#                       und zu testen.
#
#                    c) Wenn das Script als root aufgerufen wird, ist die 
#                       Ausgabe:
#                       'You are root'
#                       Ansonsten ist die Ausgabe:
#                       'You are just a normal user, but mom loves you anyway'
#                    
# Fehlerbehandlung:  Keine
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
#
# Hinweise:          Zum Testen können Sie sudo oder su verwenden. 
#                    Das Passwort des 
#                    root-Users können Sie selbst mit sudo setzen.
# ******************** Ihre Lösung: ******************** 
source /home/student/mylib
if am_i_root; then
   echo 'You are root'
else
   echo 'You are just a normal user, but mom loves you anyway'
fi
    
