#!/usr/bin/env bash

CPI=${CPI:-cp -i}


# Args
from=$1
to=$2

# If the second arg is a directory, we need to add the file name
base=$(basename "$from")
if [ -d "$to" ]; then
	to=$to/$base
fi

# The file can either point to the same file (if you're linking)
if [[ "${CPI}" =~ .*"ln".* ]]; then
	if [ ! "$from" -ef "$to" ]; then
		${CPI} $from $to || true
	fi
# Or it needs to have the right contents
elif [ $(cmp --silent "$from" "$to" && echo 1 || echo 0) -eq "0" ]; then
	${CPI} $from $to || true
fi
