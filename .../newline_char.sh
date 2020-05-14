#!/bin/bash
# newline_char.sh : demonstriert die Verwendung des Zeilenumbruchs in Variablen

erste=1
zweite=2
newline='\n'
zeile=$erste$newline$zweite
echo -e $zeile
