function __join_by__alembic {
    local IFS="$1"
    shift
    echo "$*"
}

__complete_alembic()
{
    local cur prev
    COMPREPLY=()
    if [ "$(type -t _get_comp_words_by_ref)" == "function" ]; then
         _get_comp_words_by_ref -n : cur prev
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
    fi

    local opts
    opts=
    opts+=" -h --help"
    opts+=" --raiseerr"
    # Ones with arguments, see below
    opts+=" -c --config"
    opts+=" -n --name"
    opts+=" -x"

    local actions
    actions=""
    actions+=" branches heads"
    actions+=" current history show"
    actions+=" downgrade upgrade stamp"
    actions+=" edit revision merge"
    actions+=" list_templates init"

    # Figure out the current action
    cur_action=$(echo "${COMP_WORDS}" | awk "/^.*("`__join_by__alembic '|' $actions`").*/{ print \$1; }")

    # Config file choice
    if [[ "${prev}" == "-c" || "${prev}" == "--config" ]]; then
        COMPREPLY=( $(compgen -A file -X '!*.ini' -- ${cur}) )

    # Config Group (Name) to use
    elif [[ "${prev}" == "-n" || "${prev}" == "--name" ]]; then
        # No completions, Needs arbitrary section names
        COMPREPLY=( $(compgen -W "" -- ${cur}) )

    # Additional options
    elif [[ "${prev}" == "-x" ]]; then
        # No completions, just needs some text
        COMPREPLY=( $(compgen -W "" -- ${cur}) )

    # Complete the flags themselves
    elif [[ ${cur} == -* ]] ; then
        # Complete the remaining options
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

    # Complete the main action
    elif [[ "${cur_action}" == "" ]]; then
        COMPREPLY=( $(compgen -W "${actions}" -- ${cur}) )

    fi
}
complete -F __complete_alembic alembic

