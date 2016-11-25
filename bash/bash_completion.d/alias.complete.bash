_volume() {
	local cur prev
    COMPREPLY=()
    if [ "$(type -t _get_comp_words_by_ref)" == "function" ]; then
         _get_comp_words_by_ref -n : cur prev
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
    fi

    COMPREPLY=( $(compgen -W "{0..100}" -- ${cur}) )
}
complete -F _volume volume
complete -F _noop mute bell audio_info is_muted

complete -F _noop urlencode update_all
complete -F _noop disksize
complete -F _noop pbclean

complete -F _noop hs

complete -F _noop restart_audio dns_flush

complete -A function helpfunc
complete -A builtin helpman
