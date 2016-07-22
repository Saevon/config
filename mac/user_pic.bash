#!/usr/bin/env bash

user=$1
file=$2

function usage() {
    echo "usage %prog user"
    echo ""
    echo "  Dumps the users profile pic"
}

if [ $(id -u "$user" > /dev/null) ]; then
    >&2 echo "ERROR: Invalid username"
fi

dscl . -read /Users/${user} JPEGPhoto | tail -1 | xxd -r -p
