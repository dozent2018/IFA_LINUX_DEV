#!/bin/bash
# summe.sh    : Funktionsdefinition summe(): Summiert die Argumente
# Version     : 1.0
# Datum       : 20180820
# ================================================================ 

summe() {
    sum=0
    for i in $@
    do
	let sum=sum+$i
    done
    echo $sum
    return 0
}

