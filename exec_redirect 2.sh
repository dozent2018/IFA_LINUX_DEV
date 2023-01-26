#!bin/bash
# exec_redirect.sh : zeigt Ausgabeumlenkung für alle Kommandos
ls              # Output auf dem Bildschirm
exec > out.log  # Ab hier wird stdout umgelenkt
exec 2> err.log # Ab hier wird stderr umgelenkt
ls Foo bar
ls Foo BUM

