#!/bin/bash
# gerade.sh : demonstriert den Modulo-Operator und if .. then .. else

# Modulo-Operator ermittelt den Divisionsrest
rest=$(($1 % 2))

if [ $rest -eq 0 ]
then
    echo $1 ist gerade
else
    echo $1 ist ungerade
fi
