#!/bin/bash


################################################################################
################### FREE OCSAF FUNCTION - AvailabilityCheck ####################
################################################################################

#########################################################################################################################
#  FROM THE FREECYBERSECURITY.ORG TESTING-PROJECT (GNU-GPLv3) - https://freecybersecurity.org                           #
#  Script for checking Online-Status by ICMP-PING and HTTP-Header analysis.                                             #
#  Use only with legal authorization and at your own risk! ANY LIABILITY WILL BE REJECTED!                              #
#                                                                                                                       #
#  Script-Programming by Mathias Gut & Christian Kiß, Netchange Informatik GmbH under GNU-GPLv3                         # 
#  Special thanks to the community and also for your personal project support.                                          #
#########################################################################################################################


#######################
### TOOL USAGE TEXT ###
#######################

usage() {
	echo "From the Free OCSAF project"
	echo "Free OCSAF PWNED 0.1 - GPLv3 (https://freecybersecurity.org)"
	echo "Use only with legal authorization and at your own risk!"
       	echo "ANY LIABILITY WILL BE REJECTED!"
       	echo ""	
	echo "USAGE:"
	echo "  ./availabilitycheck.sh -o <ip-address or hostname> -p"	
       	echo ""	
	echo "EXAMPLE:"
       	echo "  ./availabilitycheck.sh -o 192.168.1.1 -p"
	echo "  ./availabilitycheck.sh -o www.<Domain> -w"
       	echo ""	
	echo "OPTIONS:"
	echo "  -h, help - this beautiful text"
	echo "  -o, object <ip-address or hostname>"
	echo "  -p, ICMP-PING - ip address or hostname"
	echo "  -w, HTTP Website header testing - http(s)://URL"
	echo "  -c, color on"
       	echo ""
	echo "NOTES:"
	echo "#See also the MAN PAGE - https://freecybersecurity.org"
}

###########################################################################


###############################
### GETOPTS - TOOL OPTIONS  ###
###############################

while getopts "o:hpwc" opt; do
	case ${opt} in
		h) usage; exit 1;;
		o) object="$OPTARG"; opt_arg1=1;;
		p) icmp=1;;
		w) web=1;;
		c) color=1;;
		\?) echo "**Unknown option**" >&2; echo ""; usage; exit 1;;
        	:) echo "**Missing option argument**" >&2; echo ""; usage; exit 1;;
		*) usage; exit 1;;
  	esac
  	done
	shift $(( OPTIND - 1 ))

#Check if options are set
if [ "$opt_arg1" == "" ]; then
	echo "**No object set**"
	echo ""
	usage
	exit 1
fi

if [ "$icmp" == "" ] && [ "$web" == "" ]; then
	echo "**No check set**"
	echo ""
	usage
	exit 1
fi

#########################################################


###############
### COLORS  ###
###############

greenON=""
redON=""
colorOFF=""

if [[ $color -eq 1 ]]; then
	colorOFF='\e[39m'
	greenON='\e[92m'
	redON='\e[91m'
fi

#########################################################

 
################### funcAvailability ####################
funcAvailability() {

	#unset status
	unset urlStatusHTTP
	unset urlStatusHTTPS
	unset statusPing
	unset statusHTTPHeader
	unset statusHTTPSHeader
	
	#program parameters as local
	local testObject=$object
	local icmpCheck=$icmp
	local webCheck=$web
	#local colorCheck=$color
	
	#local variables
	local imOnlineCheck="9.9.9.9"
	local scriptPath="./"
	local dateTime=$(date +%Y-%m-%d_%H:%M:%S)
	
	# Check if I'm online
	ping -q -c1 $imOnlineCheck > /dev/null
     	if [ $? -eq 0 ]; then
		#Check Online-Status / Ping
		if [[ $icmpCheck -eq 1 ]]; then
		#unset statusPing
        		ping -q -c2 $testObject > /dev/null
        		if [ $? -eq 0 ]; then
        			echo -e "$testObject - Ping-Test ${greenON}OK${colorOFF}"
                		statusPing="OK"
        		else
            			echo -e "$testObject - Ping-Test ${redON}FAIL${colorOFF}"
            			statusPing="FAIL"
        		fi
		fi

		if [[ $webCheck -eq 1 ]]; then
			# Check Online-Status / HTTP-Header
            		urlStatusHTTP=$(curl -o /dev/null --silent --location --insecure --head \
				--max-time 15 --write-out '%{http_code}' "$testObject" )
            		if [ $urlStatusHTTP -eq 200 ]; then
                		echo -e "$testObject - HTTP-Header-Test $urlStatusHTTP ${greenON}OK${colorOFF}"
				statusHTTPHeader="OK"
            		else
                		echo -e "$testObject - HTTP-Header-Test $urlStatusHTTP ${redON}FAIL${colorOFF}"
                    		
				statusHTTPHeader="FAIL"
            			
			fi
            		
			# Check Online-Status / HTTPS-Header
			if [ $statusHTTPHeader == "FAIL" ]; then
           			urlStatusHTTPS=$(curl -o /dev/null --silent --location --insecure --head \
					--max-time 15 --write-out '%{http_code}' "https://$testObject" )
            			if [ $urlStatusHTTPS -eq 200 ]; then
 					echo -e "$testObject - HTTP-Header-HTTPS-Test $urlStatusHTTPS ${greenON}OK${colorOFF}"
 					statusHTTPSHeader="OK"
            			else
                    			echo -e "$testObject - HTTP-Header-HTTPS-Test $urlStatusHTTPS ${redON}FAIL${colorOFF}"
                    			statusHTTPSHeader="FAIL"
            			fi
			fi
		fi
	fi
}

###########################################


####### MAIN PROGRAM #######

#Testing a object with ICMP, HTTP
if [ $opt_arg1 -eq 1 ]; then
	echo ""
	echo "#######################################"
	echo "#### FreeOCSAF Availability-CHECK  ####"
	echo "#######################################"
	echo ""
	funcAvailability
	echo ""
fi

################### END ###################
