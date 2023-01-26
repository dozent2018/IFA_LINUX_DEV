#!/bin/bash     
# backupd2.sh : Variante von backupd1.sh
#bash_version   :3.2.57(1)-release
#============================================================================

# Basename leifert den letzten Teil eines Pfads
# Kommandosubstitution weist die Ausabe von an Variable zu
quellname=`basename $1`
# alternativ: quellname=$(basename $1)

# Kommandosubstitution weist die Ausabe von date an Variable datum zu
datum=`date +%Y_%m_%d`
ziel=$2/$quellname.$datum

# 
cp -R $1  $ziel

