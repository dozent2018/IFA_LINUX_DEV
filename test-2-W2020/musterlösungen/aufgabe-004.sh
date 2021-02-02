#!/bin/bash
# Name:              aufgabe-004.sh
#
# Max. Punkte:       10
#
# Themenbereich:     Konfiguration von SSH-Logins
#
# Schreiben Sie  Script, das die folgenden Anforderungen erfüllt:
# Hauptfunktion:     a) Konfiguriert das System so, dass ein SSH-Login 
#                       als Benutzer root möglich ist
#                    b) Das root-login soll sofort nach Ausführung 
#                       des Scripts möglich sein.
#
# Fehlerbehandlung:  Keine
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
# Hinweise:          Die Aufgabe kann mit zwei Kommandois gelöst werden
#                    Die Lösung soll nicht-interaktiv erfolgen, d.h. 
#                    nicht manuell mit einem Editor
#                    Nehmen Sie an, das Script wird mit 
#                    root-Berechtigungen ausgeführt
#                    Wenn Sie den Erfolg  testen wollen, können Sie mit 
#                    sudo passwd root ein Passwort für root setzen
#
#                    Vorsicht: Wenn Sie bei der Konfiguration einen
#                    Fehler machen, kann das dazu führen, dass Sie sich
#                    nicht mehr anmelden können!
#

# ******************** Ihre Lösung: ******************** 
sed -i 's/^PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config
service ssh restart
