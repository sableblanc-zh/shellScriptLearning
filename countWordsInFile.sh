#!/usr/bin/env bash
printf "## COUNTING WORDS SCRIPT LAUNCHING ##\n\n"

filepath="$1"
#Check if user has defined an input filepath
if [ ! -z $filepath ]
then
	if [ -f $filepath ]
	then
		filename=$(basename $filepath | cut -d. -f1)
		cat $filepath | tr -d [:punct:] | tr -s [:space:] | tr [:space:] "\n" | sort -i | uniq -ic | awk '{print $2, $1}' | sort -i > "${filename}_count.txt"
	else
		echo "The file $filepath doesn't exist"
		exit 1
	fi
else
	echo "Please enter an valid path of a file as parameter"
	exit 1
fi

