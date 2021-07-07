#!/bin/bash

#change owner of files and folders
# 1 args = user
# 2 args = path dir

#check user
function userExist() {
	id "$1" &>/dev/null
}

#check if run from non-root
if [ $UID -ne 0 ]; then
	echo "EROOR! Run from root"
	exit -1
fi

#check args
if [ $# -ne 2 ]; then
	echo "ERROR! Please write <username> and <directory>"
	exit -1
fi

#check user using func
if ! userExist "$1" ; then
	echo "ERROR! User $1 DOES NOT exist"
	exit -1
fi

#check dir
if [ ! -d "$2" ]; then
    	echo "ERROR! Directory $2 DOES NOT exists." 
    	exit -1
fi

#run chown
res=$(chown -R $1:$1 $2)
echo "SUCCESS! Owner is $1 for $2 directory"
