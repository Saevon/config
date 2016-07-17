# CREDIT: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=${MARKPATH:-$HOME/.marks}

# Allow the user to cd to any mark easily (with autocompletion)
export CDPATH=${CDPATH}:${MARKPATH}

function jump {
    local path=$1

    if [ "$path" == "" ]; then
        return 1;
    fi

    cd -P $MARKPATH/$path 2>/dev/null || echo "No such mark: $path"
}

function mark {
    local name=$1

    if [ "$name" == "" ]; then
        >&2 echo "Usage: mark MARK_NAME"
        >&2 echo ""
        >&2 echo "  saves the MARK_NAME so you can `jump` to it later"
        return 1;
    elif [ "$name" == "all" ]; then
        >&2 echo "invalid mark name"
        return 1;
    fi

    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$name
}

function unmark {
    local name=$1

    if [ "$name" == "" ]; then
        >&2 echo "Usage: unmark MARK_NAME|all"
        >&2 echo ""
        >&2 echo "  Removes the given MARK_NAME, prompting the user"
        >&2 echo "  if `all` is passed in, removes all of them"
        return 1;
    elif [ "$name" == "all" ]; then
        cd $MARKPATH && rm -i `ls`
    else
        rm -i $MARKPATH/$name
    fi
}

function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/ -/g' && echo -n
}

function _jump_complete() {
    local keys word

    word=${COMP_WORDS[COMP_CWORD]}
    keys=$(ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9 | grep "^$word")

    if [ ${#keys[*]} -gt 0 ]; then
        COMPREPLY=($(compgen -W "${keys[@]}" $word))
    fi

    return 0
}
complete -F _jump_complete jump
