#!/bin/bash
# autobreak.sh : Durchläuft alle Parameter, bis “auto“ gefunden wurde

for var in "$@"
do
   if [ "$var" = "auto" ]
   then
      echo "Das reicht, \"$var\" gefunden ...!"
      break
   fi
   echo $var
done

