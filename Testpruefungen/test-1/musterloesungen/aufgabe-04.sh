#!/bin/bash
# Name:              aufgabe-4.sh
# Aufgabe:           Schreiben Sie Kommandos in ein Script, die folgenden Aufgaben erfüllen:
# Hauptfunktion:     1. git konfigurieren für Ihren  user "vorname.nachname"
#                       und der Email-Adresse vorname.namchname@student.ifa.ch
#                    2. Anlegen eines neuen git-Repository /home/student/loesungen/repo
#                    3. Aufnehmen von mindestens einer Script-Datei ins repository
#                       z.B. eine Kopie eines Scripts das sie schon haben 
#                       oder eine beliebige neue Datei
#                    4. Erzeugen einer weiteren Datei mit dem Namen "Geheim" mit beliebigem 
#                       Inhalt im Repository (z.B. eine Text-Datei mit ein paar Wörtern).
#                       Es soll sichergestellt werden, dass diese Datei niemals ins Repository
#                       aufgenommen und versioniert werden soll.
#                    5. Hinzufügen und Einchecken einer ersten Version aller Dateien im Repository 
#                       ausser der Datei "Geheim". Dabei soll für diese Version die Nachricht 
#                       "aufgabe-4 erledigt" erfasst werden.
#
# Fehlerbehandlung:  Keine
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
# ******************** Ihre Lösung: ******************** 

# 1.
git config --global user.name "hans.huber"
git config --global user.email "hans.huber@student.ifa.ch"
git git config --list
# 2.
mkdir ~/loesungen/repo
cd ~/loesungen/repo
git init
# 3.
cp ~/loesungen/*.sh .
# 4.
echo "Geht Dich nichts an" > Geheim
echo Geheim > .gitignore
# 5.
git add *
git commit -m "aufgabe-4 erledigt"
