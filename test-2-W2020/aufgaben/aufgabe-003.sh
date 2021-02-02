#!/bin/bash
# Name:              aufgabe-003.sh
#
# Max. Punkte:       30
#
# Themenbereich:     Benutzerverwaltung, Gruppenverwaltung, Datei-Berechtigungen
#
# Schreiben Sie ein Script, das die Kommandos enthält,  die die folgenden 
# Anforderungen  erfüllen:
#
# Hauptfunktionen:   a) Legen Sie die  Gruppen teachers, students, class1 und 
#                     class2 an
#
#                    b) Legen Sie folgende  Benutzer mit home-Verzeichnis an:
#
#                    Account  | Passwort | PrimäreGruppe | Weitere Gruppen
#                    ----------------------------------------------------
#                    pat      | pat      | students      | class1
#                    may      | may      | students      | class1
#                    ben      | ben      | students      | class2
#                    joe      | joe      | students      | class2
#                    moe      | moe      | teachers      | sudo,class1,class2
#                    sue      | sue      | teachers      | sudo,class1,class2
#
#                    Die Shell für alle Benutzer soll /bin/bash sein
#
#                    c) Setzen Sie die Passwörter gemäss der Tabelle                    
#
#                    d) Zeigen Sie mit geeigneten Kommandos an, ob Gruppen, 
#                      User und Passwörter korrekt eingerichtet sind
#
#                    e) Richten Sie die folgenden Verzeichnisse ein:
#                   
#                    /school/class1
#                    /school/class2
#                    /school/teachers/aufgaben
#                    /school/teachers/loesungen
#                    /home/moe/privat
#                    /home/sue/privat
# 
#                    Stellen Sie die folgenden Bedingungen durch eine 
#                    geeignete Zuweisung der Eigentümerschaft und 
#                    Berechtigungen der Verzeichnissen sicher:
#                       f) Dateien in /school/class1 können nur von pat, may,
#                          moe und sue aufgelistet, angelegt, gelesen, 
#                          gelöscht und geändert werden.
#                       g) Dateien in /school/class2 können nur von ben, joe, 
#                          moe und sue aufgelistet, angelegt, gelesen, 
#                          gelöscht und geändert werden.
#                       h) Dateien in /school/teachers/aufgaben können nur 
#                          von moe und sue angelegt, gelöscht und geändert 
#                          werden. Alle Benutzer können die Dateien auflisten 
#                          und lesen.
#                       i) Dateien in /school/teachers/loesungen können nur 
#                          von moe und sue aufgelistet, gelesen, angelegt, 
#                          gelöscht und geändert werden. 
#                       j) Dateien in /home/moe können nur von moe und sue 
#                          aufgelistet und gelesen werden.
#                          Nur moe kann hier Dateien anlegen, löschen und 
#                          verändern. 
#                       k) Dateien in /home/sue können nur von moe und sue 
#                          aufgelistet und gelesen werden.
#                          Nur sue kann hier Dateien anlegen, löschen und 
#                          verändern. 
#                       l) Auf die Dateien in /home/moe/privat kann nur moe 
#                          zugreifen (Lesen, Schreiben, Löschen, Auflisten)
#                       m) Auf die Dateien in /home/sue/privat kann nur sue 
#                          zugreifen (Lesen, Schreiben, Löschen, Auflisten)
#                    Anmerkung: Der account root hat natürlich überall alle 
#                    Berechtigungen
#                    
# Hinweise:          Nehmen Sie an, dass das Script als root oder mit sudo 
#                    ausgeführt wird. Sie brauchen also nicht sudo vor 
#                    jedem Kommando angeben.
#
# ******************** Ihre Lösung: ******************** 

# 2 Punkte - Gruppen anlegen (Falls noch nicht vorhanden). Ihre Kommandos:

# 3 Punkte -  User Accounts anlegen. Ihre Kommandos:

# 2 Punkte - Passwörter setzen. Ihre Kommandos:

# 3 Punkte - Bisherige Ergebnisse überprüfen. Ihre Kommandos:

# 4 Punkte - Verzeichnisse anlegen. Ihre Kommandos:

# 12 Punkte - Besitzer, Gruppeni und Berechtigungen setzen. Ihre Kommandos:

