##########################################
# Taken from "Wicked Cool Shell Scripts"
# Used for mac os terminals
# Wrapper code from the open command
#
##########################################

#!/bin/bash

# $@ refers to all of the shell script's command line arguments
if ! open "$@" > /dev/null 2>&1 ; then
	if ! open -a "$@" >/dev/null 2>&1 ; then
		# if there is more than one argument, quit
		if [ $# -gt 1 ] ; then
			echo "Opening more than one program not supported" >&2
			exit 1
		else 
			# change all upper case to lower case
			case $(echo $1 | tr '[:upper:]' '[:lower:]') in 
			activ*|cpu	) app="Activity Monitor"	;;
			word		) app="Microsoft Word"		;;
			*		) echo "open: dont know what to do with $1" >&2
				exit 1
			esac 
			open -a "$app"
		fi
	fi
fi

exit 0


