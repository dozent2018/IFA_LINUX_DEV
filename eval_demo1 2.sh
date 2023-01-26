#!/bin/bash
# eval_demo1.sh : Dynamische Kommandoausführung mit eval

# Aufrufe script1 ... script5 werden Variablen zugewiesen
Mon='script1 -f'
Tue='script1 -i'
Wed='script2 -f'
Thu='script2 -i'
Fri='script3 -f' 
Sat='script4 -f' 
Sun='script5 -f' 
# Der Wochentag wird in der Variablen Day zugewiesen
Day=`date +"%a"`

PATH=.          # Wenn nötig: Anpassen
echo Ohne eval
COMMAND=$Day
# Das schlägt fehl:
$PATH/$COMMAND

# Das funktioniert:
echo Mit eval
eval COMMAND=\$$Day
$PATH/$COMMAND
