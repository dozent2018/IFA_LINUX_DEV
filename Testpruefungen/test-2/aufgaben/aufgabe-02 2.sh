#!/bin/bash
# Name:              aufgabe-002.sh
#
# Max. Punktzahl:    34
#
# Themenbereich:     Automatisierter Test von Scripts, Protokollierung der 
#                    Ausgaben auf stdout und stderr und des Exit-Codes
#
# Schreiben Sie  Script, das die folgenden Anforderungen erfüllt:
#
# Hauptfunktion:     a) Ein Kommando, das dem Script übergeben wird, wird 
#                    im Script ausgeführt. Keinerlei Ausgaben des Kommandos 
#                    sollen angezeigt werden.
#                    Stattdessen sollen sie zusammen  mit der Information, 
#                    ob das Kommando erfolgreich war, in der Logdatei 
#                    aufgabe-002.sh protokolliert werden.         
#
#                    b) Die Logdatei wird in einem Verzeichnis angelegt, 
#                    das in der Umgebungsvariablen LOGDIR festgelegt ist. 
#                    Wenn LOGDIR leer ist oder nicht existiert, liegt die 
#                    Logdatei im Home-Vereichnis des Benutzers.
#
#                    c) Jeder Eintrag in der Logdatei beginnt mit einer 
#                    Statuszeile. Sie enthält Datum und der Uhrzeit im Format 
#                    JJJJ.MM.TT HH:MM:SS, das Kommando selbst und bei Erfolg 
#                    des Kommandos das Wort SUCCESS, bei Misserfolg FAILURE. 
#                    Nach FAILURE steht der Exit-Code des Kommandos.
#                    Anschliessend werden die Ausgaben des Kommandos in der 
#                    Datei protokolliert.  Beachten Sie das genaue Format der 
#                    Einträge in den folgenden Beispielen!
#
#                    Beispiel 1: Aufruf von ./aufgabe-002.sh pwd 
#                    Die folgenden Zeilen werden an die Logdatei angehängt:
#                    2020.08.11 10:43:50 pwd SUCCESS 
#                    /home/student/aufgaben
#
#                    Beispiel 2: Aufruf ist ./aufgabe-002.sh 'mkdir /student' 
#                    Das mkdir-Kommando schlägt fehl. 
#                    Die folgenden Zeilen werden an die Logdatei angehängt:
#                    2020.08.11 10:44:52 mkdir /student FAILURE Exit-Code: 1
#                    mkdir: cannot create directory ‘/student’: Permission denied
#
#                    d) Die Lösung soll auch funktionieren, wenn das übergebene 
#                    Kommando Pipes enthält, z.B. beim Aufruf von 
#                    ./aufgabe-002.sh 'ps | sort'
#
#                    e) Wenn das Kommando mehrere Zeilen ausgibt, sollen die 
#                    ausgegebenen Zeilen auch im Logfile als einzelne Zeilen 
#                    erscheinen
#                    
#                    f) Nach normaler Ausführung gibt Ihr Script den 
#                    Exit-Code 0 zurück.
#
# Fehlerbehandlung:  g)  Wenn beim Aufruf des Scripts kein Kommando angegeben 
#                    wurde, wird die folgende Fehlermeldung auf stderr ausgegeben:
#                    'usage: aufgabe-002.sh command'
#                    In diesem Fall wird abgebrochen und der Exit-Code 1 
#                    zurückgegeben
#
#                    h)  Wenn nicht in die Logdatei geschrieben werden kann, wird 
#                    die folgende Fehlermeldung auf stderr ausgegeben:
#                    'error: cannot write to logfile ', gefolgt von Pfad und 
#                    Dateinamen der Logdatei. Das Script wird abgebrochen und der 
#                    Exit-Code 2 zurückgegeben.
#
# Einschränkungen:   1. Benennen sie diese Datei nicht um. 
#                    2. Verwenden Sie keine andere Shell als /bin/bash
#
# Hinweise           Für eine nur teilweise den Anforderungen a-h entsprechende 
#                    Lösung  können Teilpunkte erzielt werden
#                    Es ist möglich, die Aufgabe mit oder ohne Verwendung von
#                    temporären Dateien zu lösen
#
# ******************** Ihre Lösung: ******************** 
