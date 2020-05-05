# demonstriert globale und lokale Gültigkeit von Variablen
clear
f1() { 
    local var1="var1 aus f1"
    echo $var1; echo $var2; 
}

f2() { 
    local var1="var1 aus f2()"
    var2="var2 aus f2()"
    echo $var1; echo $var2; 
}

var1="var1 aus Hauptprogramm"
var2="var2 aus Hauptprogramm"
echo "*** 1. Aufruf von f1()"
f1
echo "*** Nach Aufruf von f1()"
echo $var1; echo $var2; echo 
echo "*** 1. Aufruf von f2()"
f2
echo "*** Nach Aufruf von f2()"
echo $var1; echo $var2; echo 
echo "*** 2. Aufruf von f1()"
f1
