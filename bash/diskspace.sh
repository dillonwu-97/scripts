#!/bin/bash

# Script taken from "Wicked Cool Scripts" (#38)
# disk space summarizes available diskspace in a readable format

# $$ is the process id of the shell interpreter running the script
tempfile="/tmp/available.$$"

# good explanation of trap function can be found here https://www.linuxjournal.com/content/bash-trap-command
# basic idea is that the trap function removes the $tempfile on exit
# the trap command basically allows you to catch signals and execute code when they occur. In this case, the trap function captures the EXIT signal and executes the block of code inside the quotations when it occurs
trap "rm -f $tempfile" EXIT

# EOF is a "Here" tag. The shell reads input from the current source until a line containing EOF with no trailing characters is seen
cat << 'EOF' > $tempfile
# In awk, the BEGIN / END is executed only once; in this case, we execute sum over all of the output that is piped into the function. This means that we take the 4th argument in df -k and add it to the sum variable. The 4th argument contains the storage space of each partition on the machine in 512-byte units
	{ 
#		printf $4
#		printf "\n" 
		sum += $4 
	}
END	{ 
		mb = sum / 1024 
		gb = mb / 1024 
		printf "%.0f MB (%.2fGB) of available disk space\n", mb, gb
	}
EOF

# tempfile contains awk code
# -f means read from program file
# in this case, we write the code above the tempfile and finish executing at EOF
df -k | awk -f $tempfile

exit 0

