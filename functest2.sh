#!/bin/bash     
# functest2     : Demo Funktion mit Argumenten
#date           :20180820
#version        :1.0    
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================

summe() {
    sum=0
    for i in $@
    do
		let sum=sum+$i
    done
    echo $sum
    return 0
}

summe $*

