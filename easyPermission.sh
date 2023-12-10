#!/usr/bin/env bash

#lire du terminal pour récupérer le chemin (-a to read them as a table/array)
printf "Files to be updated :\n>"
read -a files

echo "[DEBUG]$files"

#use " " so it take the input as a string
if [ -z "$files" ]; then
	echo "Please enter at least 1 valid file path!"
	read -p "Files to update :" files
fi

#lire du terminal pour la permission à attribuer aux fichiers 
printf "New permission :\n>" 
read permis

#get the length of the permission and convert it into an int
length=$(echo "${#permis}")

if [ length = "3" ] || [[ ${#permis} -eq 3 ]]; then
	printf "[DEBUG] new permission = $permis\n"
else
	printf "Please enter a permission octal with 3 number [0-7]\n"
	read -p "New permission :" permis
fi

for file in "${files[@]}"; do
	echo "Loading file $file"
	filepath=$file

	if [ -f $filepath ];then
		sudo chmod $permis $filepath
		printf "$filepath permissions changed to $permis\n"
	else
		printf "File name or path is not valid : $file\n"
	fi
done
