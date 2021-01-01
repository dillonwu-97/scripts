#!/bin/bash

# This program checks to see if a command is in PATH
# Source: Wicket Cool Shell Scripts #1

in_path() {
	cmd=$1
	ourpath=$2
	result=1
	oldIFS=$IFS # IFS stands for internal field separator
	IFS=:
#	echo "$cmd $IFS"
#	echo "starting loop"
	for directory in $ourpath
	do
	#	echo "in loop"
	#	echo "directory is $directory"
		if [ -x $directory/$cmd ] ; then
			result=0 # found the command
		fi
	done
	IFS=$oldIFS
	return $result
}

checkForCmdInPath() {
	var=$1
	if [ "$var" != "" ] ; then
		if [ "${var:0:1}" = "/" ] ; then # this takes the variable var and takes the first character
			if [ ! -x $var ] ; then
				return 1
			fi
		elif !  in_path $var "$PATH" ; then
			return 2
		fi
	fi
	
}

if [ $# -ne 1 ]; then
	echo "Usage: $0 command" >&2 # redirect to standard error
	exit 1
fi

checkForCmdInPath "$1"
case $? in
	0) echo "$1 found in PATH" ;;
	1) echo "$1 not found or not executable" ;;
	2) echo "$1 not found in PATH" ;;
esac

exit 0

