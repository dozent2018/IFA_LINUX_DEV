#!/bin/bash     
# paramtest7.sh : Prüft den Typ der Dateien, die als Parameter übergeben wurden
#author         :Jochen Reinholdt
#date           :20180718
#version        :1      
#usage          :./paramtest7 parameterliste
#notes          :Benutzt for-schleife und $@
#bash_version   :3.2.57(1)-release
#============================================================================

nparams=$# 

for parameter in $@
do
   if [ -e $parameter ]
   then
        echo Eintrag $parameter existiert
   fi
   if [ -f $parameter ]
   then
        echo Eintrag $parameter ist eine normale Datei
   fi 
   if [ -d $parameter ]
   then
        echo Eintrag $parameter ist ein Verzeichnis
   fi 
done
