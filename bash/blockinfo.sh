#!/bin/bash

# Script source: Wicked Cool Shell Scripts
# This script gets information about a specific bitcoin address
# Tools used: curl

if [ $# -ne 1 ]
then
	echo "Usage: $0 <address>"
	exit 1
fi

base_url="https://blockchain.info/q/"

balance=$(curl -s $base_url"/addressbalance/"$1)
recv=$(curl -s $base_url"/getreceivedbyaddress/"$1)
sent=$(curl -s $base_url"/getsentbyaddress/"$1)
first_made=$(curl -s $base_url"/addressfirstseen/"$1)

echo "Balance: "$balance
echo "Receive By Address: $recv"
echo "Set By Address: $sent"
echo "First seen: $(date -d @$first_made)"

