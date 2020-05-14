#!/bin/bash     
# functest1 : Demo Definition und Aufruf von Funktionen
#date           :20180820
#version        :1.0    
#usage          :./functest1
#notes          : Eingebaute Variable FUNCNAME enthält den Namen der aktuellen Fuktion
#bash_version   :3.2.57(1)-release
#============================================================================

funktion1() {
	echo Ausführung von $FUNCNAME
}

function funktion2 {
	echo Ausführung von $FUNCNAME
}

funktion1
funktion2
