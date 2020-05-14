#!/bin/bash     
# neg_demo.sh   : Demonstriert den Einsatz des Negationsoperators !
#============================================================================

# neg_demo: Demonstriert die Negation mit !

file=$1

if [ ! -e $file ] 
then 
    if ! touch $file 
    then 
        echo "touch $file fehlgeschlagen" 
        exit 1
    else
        echo "$file angelegt" 
    fi 
else
    echo "$file existiert schon" 
fi
echo "$file vorhanden!"

