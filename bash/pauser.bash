#!/usr/bin/env bash

function pause_process() {
    PID=$1

    if ! ps -p ${PID} >& /dev/null ; then
        # process is effectively dead
        return;
    fi

    echo -n "  pausing: "
    ps -c -o pid=,command= -p ${PID} |  awk '{if ($2 == "bash") { system("ps -o pid=,command= -p " $1) } else { print $0 } }'
    kill -STOP ${PID};
}

function resume_process() {
    PID=$1

    if ! ps -p ${PID} >& /dev/null ; then
        # process is effectively dead
        return;
    fi

    echo -n "  resuming: "
    ps -c -o pid=,command= -p ${PID} |  awk '{if ($2 == "bash") { system("ps -o pid=,command= -p " $1) } else { print $0 } }'
    kill -CONT ${PID};
}


function map() {
    for pid in `eval $1`; do
        $2 ${pid};
    done
}

PGREP_FLAGS="-U ${USER}"

function search_map() {
    map "pgrep ${PGREP_FLAGS} -f '$1'" $2
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

# Quit an OS X application from the command line
# function quit_app () {
#     for app in $*; do
#         osascript -e 'quit app "'$app'"'
#     done
# }
# function relaunch () {
#     for app in $*; do
#         osascript -e 'quit app "'$app'"';
#         sleep 2;
#         open -a $app
#     done
# }

