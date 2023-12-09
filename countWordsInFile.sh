#!/usr/bin/env bash
printf "## COUNTING WORDS SCRIPT LAUNCHING ##\n\n"

filepath="$1"
#Check if user has defined an input filepath
if [ ! -z $filepath ]
then
	if [ -f $filepath ]
	then
 		#Get the name of the file to create the output word count results
		filename=$(basename $filepath | cut -d. -f1)

  		#word count result will be sorted by the alphabetic order of all occurent words, following by their count.
		cat $filepath | tr -d [:punct:] | tr -s [:space:] | tr [:space:] "\n" | sort -i | uniq -ic | awk '{print $2, $1}' | sort -i > "${filename}_count.txt"
	else
		echo "The file $filepath doesn't exist"
		exit 1
	fi
else
	echo "Please enter an valid path of a file as parameter"
	exit 1
fi

