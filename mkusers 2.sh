#!/bin/bash
# mkusers.sh    : Legt eine Anzahl anonymer Benutzer mit Passwort an 
#description    :Legt eine Anzahl Benutzeraccounts an und erzeugt für jeden account  ein neues
#                Passwort. Erzeugt eine Liste von Accountnamen und Passworten
#                Die Usernamen sind nummeriert, z.B.: student1, student2, student3, ....
#                Mit dem 1. Parameter wird der Anfang des Usernamens vergeben (z.B. "student")
#                Mit dem 2. Parameter wird der Beginn der Nummerierung vergeben (z.B. 1)
#                Prüft, ob bereits ein Account mit dem Namen existiert, wenn ja Abbruch
#date           :20181018
#version        :1.0       
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================
export usage_text="$(basename $0) name-prefix num-accounts nam-start-number [name-of-pwlist]"
err_usage
err_usage Ersatztext
exit

# Parameter auswerten
prefix=$1
numusers=$2
startwith=$3
let endwith=$startwith+$numusers

# hier wird seq verwendet, um eine Liste von Nummern zu erzeugen
# Die Schleife, in der die Namen zusammengesetzt werden und die
# Accounts angelegt werden kann natürlich auch anders geschriieben werden
for i in $(seq $startwith $endwith)
do
	username=$prefix$i
    # Test: Existenz Account mit getent auf /etc/passwd, möglich wäre auch ein test mit id -u $username
	if getent passwd $username >/dev/null 2>&1
	then
		echo $username already exists
	else
		echo $username will be created
		useradd -g students -m -k /home/dozent $username
        # pwgen 12 1 erzeugt 1 zufälliges Passwort mit der Länge 12 Zeichen
		password=$(pwgen 12 1)
		echo $username:$password >> pwlist
	fi
done

# Passworte mit chpasswd setzen (als root)
# cat pwlist | chpasswd
