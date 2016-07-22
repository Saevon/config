function _noop() {
	COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

    return 0
}
