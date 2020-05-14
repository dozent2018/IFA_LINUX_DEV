#!/bin/bash
# printf_demo.sh : demonstriert die formatierte Ausgabe mit printf

printf "%-20s %6s %10s\n" Artikel Anzahl Preis
for posten in "Shirt 5 29.75" "Socken 100 999" "Schuhe 2 178.60"
do
    printf "%-20s %6d %10.2f\n" $posten
done
