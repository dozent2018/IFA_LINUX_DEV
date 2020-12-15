#!/bin/bash
# Name:              aufgabe-7.sh
# Themen:            Kommandos zur Text-Manipulation in Dateien, if oder case
# Aufgabe:           Schreiben Sie ein Script, das die folgende Aufgabe erfüllt:
# Hauptfunktion:     In der Datei /etc/ssh/sshd_config soll die Einstellung, ob ein Login
#                    mit Passwort systemweit erlaubt oder verboten ist, geändert werden
#                    "PasswordAuthentication" ist das entsprechende Schlüsselwort in der Datei.
#                    a) PasswordAuthentication yes wird dort durch PasswordAuthentication no ersetzt,
#                       wenn das 1. Argument des Scripts "no" ist
#                    b) PasswordAuthentication no wird dort durch PasswordAuthentication yes ersetzt,
#                       wenn das 1. Argument des Scripts "yes" ist
#                    c) wenn das 1. Argument "status" ist, wird  Zeile aus /etc/ssh/sshd_config,
#                       die "PasswordAuthentication " enthält ausgegeben
#                    Nehmen Sie an, dass das Script als root oder mit sudo aufgerufen wurde und Sie
#                    somit die Berechtigung haben, die Datei zu ändern
# Beispiel:
#                    $ aufgabe-7.sh  yes
#                    $ aufgabe-7.sh  status
#                    PasswordAuthentication yes
#                    
#                    $ aufgabe-7.sh  no
#                    $ aufgabe-7.sh  status
#                    PasswordAuthentication no
#
# Fehlerbehandlung:  e) Prüfung, ob "yes","no" oder "status" angegeben wurde. 
#                       Fehlermeldung auf stderr, falls nicht: 
#                       "usage: aufgabe-7.sh yes|no|status"
#                    f) Im Fehlerfall: Beenden des Scripts mit dem Rückgabewert 1
#
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
#                    3. Verwenden sie keinen interaktiven Editor, sondern ein Kommando für die
#                       Änderung in /etc/ssh/sshd_config
# ******************** Ihre Lösung: ******************** 

