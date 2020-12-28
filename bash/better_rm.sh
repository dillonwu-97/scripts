#!/bin/bash

# Source: Wicked Cool Shell Scripts
# This deletes files but also makes a copy before doing so

archivedir="$HOME/.deleted-files"
realrm="$(which rm)"
copy="$(which cp) -R"

# $# = number of arguments 
if [ $# -eq 0 ]
then
	exec $realrm
fi

# echo $@

flags=""
while getopts "dfiPRrvW" opt
do
	case $opt in
		f) exec $realrm "$@" ;;  # if -f is the flag, remove stuff in the args
		*) flags="$flags -$opt" ;;
	esac
done
# https://unix.stackexchange.com/questions/214141/explain-the-shell-command-shift-optind-1/214151
# Very useful for explaining shift command
# basically, it removes all options parsed by getopts so that $1 refers to the first non-option argument passed to the script
shift $(( $OPTIND - 1 ))

# checks if directory exists
if [ ! -d $archivedir ]
then
	if [ ! -w $HOME ]
	then 
		# note: the & symbol is to indicate that the subsequent value is a file descriptor and not a filename	
		echo "$0 failed; could not create $archivedir in $HOME" >&2
		exit 1
	fi
	mkdir $archivedir
	chmod 777 $archivedir
fi


for arg
do
	#echo $arg
	# the lack of command in the if statement basically means that the command being referenced is "test": http://manpages.ubuntu.com/manpages/precise/en/man1/[.1.html
	# -d means file exists and is a directory
	# -o means file exists and is owned by effective uid
	# -f means file exists and is a regular file
	if [ -f "$arg" -o -d "$arg" ]
	then
		$copy "$arg" "$archivedir"
	fi 
done

# this replaces current process with the new process
# when exec invokes realrm, it exits this script (which one?) and the return code from realrm is given to the invoking shell
exec $realrm $flags "$@"
