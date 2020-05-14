#!/bin/bash
# klammer-vergleich.sh : Vergleich ganzer Zahlen mit ((  ))
if (( $1 != $2 )); then
    echo "$1 ist nicht gleich $2"
fi
if (( $1 == $2 )); then
    echo "$1 ist gleich $2"
fi
if (( $1 >= $2 )); then
    echo "$1 ist grösser oder gleich $2"
fi
if (( $1 > $2 )); then
    echo "$1 ist grösser als $2"
fi
if (( $1 <= $2 )); then
    echo "$1 ist kleiner oder gleich $2"
fi
if (( $1 < $2 )); then
    echo "$1 ist kleiner als $2"
fi
