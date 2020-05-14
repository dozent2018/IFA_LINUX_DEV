#!/bin/bash
# subshell_falle.sh : demonstriert Subshell nach | while ...

export zeilen=0
echo Zunächst in der Shell Nr. $BASHPID
cat textdatei | while read zeile
do
    [ $zeilen -eq 0 ] && echo jetzt in der Subshell Nr. $BASHPID
    let zeilen=zeilen+1
    echo $zeilen $zeile
done
echo Wieder in Shell Nr. $BASHPID
echo $zeilen gelesen
