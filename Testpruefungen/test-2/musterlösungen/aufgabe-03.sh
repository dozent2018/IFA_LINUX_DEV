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
# Hauptfunktionen:   a) Legen Sie die  Gruppen teachers, students, class1 und # class2 an
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
groupadd teachers
groupadd students 
groupadd class1
groupadd class2

# 3 Punkte -  User Accounts anlegen. Ihre Kommandos:
useradd -m -s /bin/bash -g students -G class1 pat
useradd -m -s /bin/bash -g students -G class1 may
useradd -m -s /bin/bash -g students -G class2 ben
useradd -m -s /bin/bash -g students -G class2 joe
useradd -m -s /bin/bash -g teachers -G class1,class2,sudo moe
useradd -m -s /bin/bash -g teachers -G class1,class2,sudo sue

# 2 Punkte - Passwörter setzen. Ihre Kommandos:
echo pat:pat | chpasswd
echo may:may | chpasswd
echo ben:ben | chpasswd
echo joe:joe | chpasswd
echo moe:moe | chpasswd
echo sue:sue | chpasswd

# 3 Punkte - Bisherige Ergebnisse überprüfen. Ihre Kommandos:
getent group teachers students class1 class1 sudo
getent passwd pat may ben joe moe sue
getent shadow pat may ben joe moe sue

# 4 Punkte - Verzeichnisse anlegen. Ihre Kommandos:
mkdir -p /school/class1
mkdir -p /school/class2
mkdir -p /school/teachers/aufgaben
mkdir -p /school/teachers/loesungen
mkdir /home/moe/privat
mkdir /home/sue/privat

# 12 Punkte - Besitzer, Gruppeni und Berechtigungen setzen. Ihre Kommandos:
chgrp class1 /school/class1
chmod g+w,o-x /school/class1
chgrp class2 /school/class2
chmod g+w,o-x /school/class2
chgrp -R teachers /school/teachers 
chmod g+w /school/teachers
chmod o-rx /school/teachers/loesungen
chown moe /home/moe/privat
chmod go-rx /home/moe/privat
chown sue /home/sue/privat
chmod go-rx /home/sue/privat

