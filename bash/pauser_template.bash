declare -a searches=()

function pause_all() {
    length=${#searches[@]}
    for (( i=0; i < ${length}; i++ )); do
        pause_app "${searches[$i]}"
    done
}

function resume_all() {
    length=${#searches[@]}
    for (( i=0; i < ${length}; i++ )); do
        resume_app "${searches[$i]}"
    done
}

searches+=('Google Chrome.app')
searches+=('Firefox.app')
searches+=('GitX.app')
searches+=('Skype.app')
searches+=('mongod')
searches+=('rabbitmq')
searches+=('Flux')
