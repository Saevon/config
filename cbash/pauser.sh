#!/bin/bash

function pause_process() {
    PID=$1

    if ! ps -p ${PID} >& /dev/null ; then
        # process is effectively dead
        return;
    fi

    echo "  pausing: " ${PID}
    kill -STOP ${PID};
}

function resume_process() {
    PID=$1

    if ! ps -p ${PID} >& /dev/null ; then
        # process is effectively dead
        return;
    fi

    echo "  resuming: " ${PID}
    kill -CONT ${PID};
}


function map() {
    for pid in `eval $1`; do
        $2 ${pid};
    done
}

PGREP_FLAGS="-U ${USER}"

function search_map() {
    map "pgrep ${PGREP_FLAGS} -f \"$1\"" $2
}

function pause_app() {
    echo pausing $1
    search_map "$1" pause_process;
}

function resume_app() {
    echo resuming $1
    search_map "$1" resume_process;
}

function status() {
    search_map "$1" echo
}

source ~/.pauser.custom.sh

