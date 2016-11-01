#!/bin/sh

#echo "Do you wish to copy all contents in calibration/ to the git initialised repo?"
#select yn in "Yes" "No"; do
#	case $yn in
#		Yes ) echo "moving stuff" break;;
#		No ) exit;;
#	esac
#done

current="$(pwd)"

help () {
	echo "usage: $(basename $0) <path to git repo calibration folder>"
}

if [ $# -lt 1 ] ;
then
	help
	exit 1
elif [ $# -gt 1 ] ;
then
	help
	exit 1
fi

while true; do
	read -p "Confirm cp to '$1': " yn
	case $yn in
		[Yy]* ) break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
done

if [ -s "$1" ] ;
then
	cp -r "$current"/calibration/*.yaml "$1"
fi
