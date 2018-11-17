#!/bin/bash

#################################################################################
################### TOOL - Skeleton - under GPLv3             ###################
################### by Mathias Gut, Netchange Informatik GmbH ###################
################### From the freecybersecurity.org Project    ###################
################### Thanks to the community!                  ###################
#################################################################################

##########################################################
#  INFORMATIONS                                          #
#   your info...                                         #
#   your info...                                         #
##########################################################


###############################
### EXAMPLE TOOL USAGE TEXT ###
###############################

usage() {
	echo "From the Free OCSAF project"
	echo "Free OCSAF PWNED 0.1 - GPLv3 (https://freecybersecurity.org)"
	echo "Use only with legal authorization and at your own risk!"
       	echo "ANY LIABILITY WILL BE REJECTED!"
       	echo ""	
	echo "USAGE:" 
	echo "  ./mycheck.sh -m <argument1>"
       	echo "  ./mycheck.sh -l <argument2>"	
       	echo ""	
	echo "EXAMPLE:"
       	echo "  ./mycheck.sh -m info@freecybersecurity.org"
       	echo ""	
	echo "OPTIONS:"
	echo "  -h, help - this beautiful text"
	echo "  -m <argument1> - description"
	echo "  -l <argument2> - description"
	echo "  -c, no color scheme set"
       	echo ""
	echo "NOTES:"
	echo "#See also the MAN PAGE - https://freecybersecurity.org"
}


###############################
### GETOPTS - TOOL OPTIONS  ###
###############################

while getopts "m:l:hc" opt; do
	case ${opt} in
		h) usage; exit 1;;
		m) input1="$OPTARG"; opt_arg1=1;;
		l) input2="$OPTARG"; opt_arg2=1;;
		c) nocolor=1;;
		\?) echo "**Unknown option**" >&2; echo ""; usage; exit 1;;
        	:) echo "**Missing option argument**" >&2; echo ""; usage; exit 1;;
		*) usage; exit 1;;
  	esac
  	done
	shift $(( OPTIND - 1 ))

#Check if opt_arg1 or opt_arg2 is set
if [ "$opt_arg1" == "" ] && [ "$opt_arg2" == "" ]; then
	echo "**No argument set**"
	echo ""
	usage
	exit 1
fi


################### your cool functions ####################

# My function for ...
# Naming convention for functions funcFunctionname() - z.B. funcMycheck()

funcMycheck() {
	
	local variable1   #Always use local functions and define them at the beginning.
	local variable2   #Always use local functions and define them at the beginning.

	if...
}


####### MAIN PROGRAM #######

echo ""
echo "####################"
echo "####  MY-CHECK  ####"
echo "####################"
echo ""

if [ "$opt_arg1" == "1" ]; then
	funcMycheck $input1
	unset mail
	echo ""
elif [ "$opt_arg2" == "1" ]; then
	while read line
	do
		funcMycheck $input2
		unset line
	done <$list
	echo ""
fi

################### END ###################