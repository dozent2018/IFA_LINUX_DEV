#!/bin/bash     
# sterne1.sh    : Gibt in einer for-schleife 10 sterne aus
#============================================================================

for ((i=1;i<=$1;i++))
do
	echo -n \*
done
echo
