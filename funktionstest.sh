#!/bin/bash
# funktionstest.sh : Einige Funktionen aus Bibliotheken nutzen

# Wenn FNCPATH nicht gesetzt is, verwende das Unterverzeichnis lib
# im aktuellen Verzeichnis
source ${FNCPATH:-./lib}/util_functions
source ${FNCPATH:-./lib}/math_functions
usage_text="Ganzzahl"

if [ $# -ne 1 ]
then
    err_usage 
    exit 1
fi

if is_int $1
then
    echo Die Zahl ist: $1
else
    err_usage 
    exit 2
fi
