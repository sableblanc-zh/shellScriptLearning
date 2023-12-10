#!/usr/bin/env bash

#lire du terminal pour récupérer le chemin
read -p "Files to be updated :" files

#sinon use read -a to read as a table of objects

#use " " so it take the input as a string
if [ -z "$files" ]; then
	echo "Please enter at least 1 valid file path!"
	read -p "Files to update :" files
fi

#echo "[DEBUG]$files"

#lire du terminal pour le username à attribuer aux fichiers 
read -p "New owner and group :" owner
#echo "[DEBUG]$owner"

for file in $files; do
	echo "Try loading file $file"
	filepath=$file
	#filepath=$(find "*$file*")
	if [ -f $filepath ];then
		printf "\n[DEBUG]$filepath get owner\n"
		old_owner=$(ls -l $filepath | awk {'print $3'})
		printf "[DEBUG]old owner=$old_owner, new=$owner\n"
		sudo chown $owner $filepath
		sudo chgrp $owner $filepath
		printf "$filepath owner \"$old_owner\" changed to \"$owner\"\n"
	else
		printf "File name or path is not valid : $file\n"
	fi
done
