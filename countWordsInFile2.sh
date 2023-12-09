#!/usr/bin/env bash
printf "## COUNTING WORDS SCRIPT LAUNCHING ##\n\n"

filepath="$1"
#Check if user has defined an input filepath
if [ ! -z $filepath ]
then
	if [ -f $filepath ]
	then
		filename=$(basename $filepath | cut -d. -f1)
		file_content=$(cat $filepath)
		file_str=$(echo $file_content | tr '[:upper:]' '[:lower:]' | tr -d [:punct:] | tr -s [:space:])

		echo $file_str | tr [:space:] "\n" | awk '{count[$1]++} 
			END {for (word in count)
			{
				print word,count[word]}
			}' | sort -k2,2nr > "${filename}_words_count.txt"
	else
		echo "The file $filepath doesn't exist"
		exit 1
	fi
else
	echo "Please enter an valid path of a file as parameter"
	exit 1
fi

