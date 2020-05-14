#!/bin/bash     
# klammer_demo.sh : Demonstriert den Einsatz von Klammerung bei logischen Operatoren
#bash_version   :3.2.57(1)-release
#============================================================================

a=1; b=5; c=0

if [ $a -eq 1 ] && [ $b -eq 5 ] || [ $c -eq 0 ]
then
	echo WAHR
else
	echo FALSCH
fi

if [ $a -eq 2 ] || [ $b -eq 5 ] && [ $c -eq 0 ]
then
    echo WAHR
else
    echo FALSCH
fi


if ([ $a -eq 9 ] && [ $b -eq 1 ]) || [ $c -eq 0 ]
then
    echo WAHR
else
    echo FALSCH
fi

if [ $a -eq 9 ] && ([ $b -eq 1 ] || [ $c -eq 0 ])
then
    echo WAHR
else
    echo FALSCH
fi
