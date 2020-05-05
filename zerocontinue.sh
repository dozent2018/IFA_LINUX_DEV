# zerocontinue.sh
# Teilt den 1. Parameter, teilt ihn durch alle weiteren Parameter
# Ist der Divisor eine 0, wird er übersprungen 

dividend=$1
shift

for divisor in "$@"
do
   if [ "$divisor" -eq 0 ]
   then
      echo "Division durch $divisor ist verboten"
      continue
   fi
   (( result = dividend / divisor ))
   echo  "$divisor / $dividend = $result"
done

