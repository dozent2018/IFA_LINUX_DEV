#!/bin/bash     
# sterne2.sh   : Gibt in einer for-schleife soviel sterne aus, wie in Parameter1 angegeben ist
#============================================================================

for (( i=1; i<=$1; i++ ))
do
	echo -n \*
done
echo
