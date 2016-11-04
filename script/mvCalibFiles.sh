#!/bin/sh

# Make the script that puts the yaml calibration files in the git repo directory

current="" # current directory
param=1 # number of parameters to accept

help () {
	echo "usage: $(basename $0) <path from> <path to git repo calibration folder>"
}

youSure () {
	while true; do
		read -p "Confirm cp to '$1': " yn
		case $yn in
			[Yy]* ) break;;
			[Nn]* ) exit;;
			* ) echo "Please answer yes or no.";;
		esac
	done
}

copy (){
	if [ -s "$2" ] ;
	then
		youSure $2
		cp -r "$1"/*.yaml "$2"
	fi
}

init () {
	if [ $# -lt 1 ] ;
	then
		help
		exit 1
	elif [ $# -gt 2 ] ;
	then
		help
		exit 1
	fi

	while true; do
		read -p "Are you located in the directory you want to copy from? : " yn
		case $yn in
			[Yy]* ) current="$(pwd)"; break;;
			[Nn]* ) param=2; break;;
			* ) echo "Please answer yes or no.";;
		esac
	done

	if [ $# -lt $param ] ;
	then
		help
		exit 1
	elif [ $# -gt $param ] ;
	then
		help
		exit 1
	fi

	if [  -z "$current" ] ; then
		copy $1 $2
	else
		current="${current%???????}"/calibration
		copy $current $1
	fi
}

init $1 $2
