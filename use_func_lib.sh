#!/bin/bash
# use_func_lib.sh : demonstriert die Nutzung einer Funktionsbibliothek
FNCPATH=${FNCPATH:-./lib}
source $FNCPATH/math_functions

if is_int $1
then
    echo $1 ist eine ganze Zahl
fi

if is_num $1
then
    echo $1 ist eine Zahl
fi


