#!/bin/bash     
# functest5 : Demo lokale Variablen 2
#date           :20180820
#version        :1.0    
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

myfunc() {
	local var=30
	echo var in myfunc: $var
}

var=0
myfunc
echo var im Hauptprogramm: $var

	
