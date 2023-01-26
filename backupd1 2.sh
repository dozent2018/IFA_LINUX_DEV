#!/bin/bash     
# backupd1.sh : Erzeugt eine Kopie des Verzeichnisses, das in $1 angegeben wurde
#bash_version   :3.2.57(1)-release
#============================================================================

dir=`basename $1`
# alternativ: dir=$(basename $1)

cp -R $1  $2\/$dir.bak

