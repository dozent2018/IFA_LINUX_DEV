#!/bin/bash
# chkdf2_step0.sh : Ester Schritt zur Aufgabe chkdf2.sh 
# liest aus der datei chkdf.cfg
# für jede zeile wird der inhalt der 1. spalte in die variable mountpoint
# und der inhalt der 2.spalte in die variable prozent zugewiesen
mountpoint=""
prozent=0
pct=0

while read mountpoint prozent
do
    pct=$(df -k  $mountpoint --output=pcent | tr -d '%' | tail -n+2)
    if [ $pct -gt $prozent ]
    then
         echo "Achtung: $mountpoint zu $pct % voll - Schwellwert von $prozent überschritten"
    fi
done < chkdf.cfg
