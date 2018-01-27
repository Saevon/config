
_git_branches_remote() {
	local remote="$1"
	git branch -a | gawk -v remote=${remote} 'match($0, / *[*]? *(remotes\/([^/]+)\/)?([^ ]+)/, cap) { if (cap[2] == remote && index(cap[3], "HEAD") == 0) { print cap[3] }}' | sort | uniq
}

_git_branches_all() {
	git branch -a | gawk 'match($0, / *[*]? *(remotes\/([^/]+)\/)?([^ ]+)/, cap) { if (index(cap[3], "HEAD") == 0) { print cap[3] }}' | sort | uniq
}

_git_push_to() {
	local cur prev
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	if [ ${COMP_CWORD} == 2 ]; then
		_git_ls_remote
	elif [ ${COMP_CWORD} == 3 ]; then
		local branches=$(_git_branches_all $1)
		COMPREPLY=( $(compgen -W "$branches" -- ${cur}) )
	fi
}

_git_push_commit() {
   local cur prev
   COMPREPLY=()
   cur="${COMP_WORDS[COMP_CWORD]}"
   prev="${COMP_WORDS[COMP_CWORD-1]}"

   if [ ${COMP_CWORD} == 2 ]; then
       _git_ls_remote
   elif [ ${COMP_CWORD} == 4 ]; then
       local branches=$(_git_branches_all $1)
       COMPREPLY=( $(compgen -W "$branches" -- ${cur}) )
   fi
}


_git_del_branch() {
	local cur prev
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	if [ ${COMP_CWORD} == 2 ]; then
		_git_ls_remote
	elif [ ${COMP_CWORD} == 3 ]; then
		local branches=$(_git_branches_remote $1)
		COMPREPLY=( $(compgen -W "$branches" -- ${cur}) )
	fi
}

_git_fetchff() {
	local cur prev
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	if [ ${COMP_CWORD} == 2 ]; then
		_git_ls_remote
	elif [ ${COMP_CWORD} == 3 ]; then
		local branches=$(_git_branches_all $1)
        local branches=$(_git_branches_remote $prev)
        COMPREPLY=( $(compgen -W "$branches" -- ${cur}) )
   fi
}

_git_kill_branch() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    if [ ${COMP_CWORD} == 2 ]; then
        _git_ls_remote
    elif [ ${COMP_CWORD} == 3 ]; then
        local branches=$(_git_branches_remote $prev)
		COMPREPLY=( $(compgen -W "$branches" -- ${cur}) )
	fi
}
