#!/bin/bash
# oddeven.sh prüft mit dem Modulo-Operator %, 
# ob der 1. Parameter eine gerade Zahl ist

rest=$(( $1 % 2 ))

# Alternativen:
# (( rest = $1 % 2 ))
# let rest=$1%2


if [ $rest -eq 0 ]
then
    echo $1 ist gerade
else
    echo $1 ist ungerade
fi
