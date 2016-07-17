function switch_user() {
    local username=$1
    local err=false

    if [ "$username" == "" ]; then
        1>&2 echo "ERROR: USER is required"
        err=true
    elif [ "$username" == `whoami` ]; then
        1>&2 echo "ERROR: can't switch to current user"
        err=true
    fi

    if [ $err == "true" ]; then
        1>&2 echo "usage: switch_user USER"
        1>&2 echo ""
        1>&2 echo "  Fast user switches to the given user"
        return 1;
    fi

    local userid=`id -u $username`

    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -switchToUserID $userid
}


function switch_out() {
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
}





function _complete_visible_users_() {
    local me=`whoami`
    local word=${COMP_WORDS[COMP_CWORD]}
    local line=${COMP_LINE}

    local cur=${COMP_WORDS[COMP_CWORD]}

    COMPREPLY=($(compgen -A user -- $cur | grep "^[^_]" | grep -v "^$me"))
    if ((${#COMPREPLY[@]}==1)) ;then
       [[ -h $COMPREPLY ]] && COMPREPLY="$COMPREPLY/"
    fi
}
complete -F _complete_visible_users_ switch_user
